package yerim.service.impl;


import java.math.BigInteger;
import java.net.http.HttpRequest;
import java.security.SecureRandom;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import yerim.dao.face.LoginDao;
import yerim.dto.Naver;
import yerim.dto.Users;
import yerim.service.face.NaverLoginService;
import yerim.util.NaverLogin;

@Service
public class NaverLoginServiceImpl implements NaverLoginService {
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());

	 //네이버 로그인 API
	 NaverLogin naverLogin = new NaverLogin();
	 @Autowired LoginDao loginDao;
	@Override
	public String getURL(HttpSession session) {
		logger.info("getURL-NAVER");
		//URL호출을 위해 naverLogin 호출
		String apiURL = naverLogin.generateURL(session);
		return apiURL;
	}
	@Override
	public String getToken(HttpSession session, String code,String state)  {

		//세션에 저장한 상태 토큰가져옴
		String storedStated = (String)session.getAttribute("state");
		String accessToken;
		if(state.equals(storedStated)) {
			accessToken = naverLogin.getAccessToken(storedStated, state, code);
			logger.info("토큰 반환 {}",accessToken);
			
			return accessToken;
			
		}else {
			return null;
		}
		
	}
	@Override
	public Users  getUserProfile(String getToken) {
		
		//회원 정보를 담을 객체
		Users naverUsers = new  Users();
		
		
		//회원 정보 조회해오기
		logger.info("getToken{}",getToken);
		String naverUserInfo = naverLogin.getnaverUserInfo(getToken);
		logger.info ("회원 정보 {}",naverUserInfo);

		//회원 정보 파싱하기
		//STRING ->json으로
		try {
			//받은 정보를 object로 변환
			JSONParser parser = new JSONParser();
			//object를 jsonObject으로 파싱
			JSONObject jsonObj = (JSONObject)parser.parse(naverUserInfo);
			
			//reseponse를 jsonObject로 파싱
			JSONObject response= (JSONObject)jsonObj.get("response");
			
			//response 안의 값들 파싱
			String naverId = (String) response.get("id");//아이디(네이버 고유 번호)
			String userNick =(String)response.get("nickname");//닉네임
			String userName =(String)response.get("name");//이름
			String userEmail =(String)response.get("email");//이메일
			String userGender =(String)response.get("gender");//성ㅂ졀
			String userBirthday =(String)response.get("birthday");//생일
			String profile_image =(String)response.get("profile_image");//프로필 사진
			String birthyear =(String)response.get("birthyear");
			String userPhone = (String)response.get("mobile");
			
			logger.info("id{}",naverId);
			logger.info("userNick{}",userNick);
			logger.info("userName{}",userName);
			logger.info("userEmail{}",userEmail);
			logger.info("userGender{}",userGender);
			logger.info("userBirthday{}",userBirthday);
			logger.info("profile_image{}",profile_image);
			logger.info("birthyear{}",birthyear);
			logger.info("userPhone{}",userPhone);

			//Users DTO에 정보 담기 
			naverUsers.setUserId(naverId);
			naverUsers.setUserNick(userNick);
			naverUsers.setUserName(userName);
			naverUsers.setUserEmail(userEmail);
			naverUsers.setUserGender(userGender);
			naverUsers.setUserBirth(userBirthday+birthyear);
			naverUsers.setUserPhoto(profile_image);
			naverUsers.setUserPhone(userPhone);
		} catch (ParseException e) {
			
		}
		
		
		return naverUsers;
	}
	
	@Override
	public boolean getIsJoin(Users userproFile) {

		if(loginDao.isNaverJoin(userproFile)>0) {
			logger.info("가입한적 있음 {}");
			return true;
		}
		
		
		return false;
	}
	@Override
	public int naverLogin(Users userproFile) {
		logger.info("네이버 회원 로그인");
		//네이버 로그인하기
		return loginDao.loginByNaver(userproFile);
	}
	@Override
	public void joinNaver(Users userproFile) {
		logger.info("네이버 회원 가입하기");
		
		loginDao.insertNaverUser(userproFile);
		
		
	}
}
