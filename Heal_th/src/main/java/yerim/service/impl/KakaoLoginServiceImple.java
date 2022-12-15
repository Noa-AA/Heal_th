package yerim.service.impl;

import java.net.URISyntaxException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;

import yerim.dao.face.LoginDao;
import yerim.dto.Users;
import yerim.service.face.KakaoLoginService;
import yerim.util.KakaoLogin;

@Service
public class KakaoLoginServiceImple implements KakaoLoginService {
	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	KakaoLogin kakaoLogin = new KakaoLogin();
	@Autowired LoginDao loginDao;
	@Override
	public String getURL() {
		logger.info("카카오 인가코드 요청URL 전달 ");
		
		String requestURL = kakaoLogin.generateKakaoURL();
		logger.info("요청  URL : {}",requestURL);
		return requestURL;
	}
	@Override
	
	public String getToken(String code) {
		logger.info("카카오 access_token 요청");
		String access_token="";
		try {
			 access_token = kakaoLogin.getaccessToken(code);
		} catch (RestClientException | URISyntaxException e) {
			e.printStackTrace();
		}		
		return access_token;
	}
	@Override
	public Users getuserInfo(String getKakaoToken) {

		//회원 정보를 담을 DTO
		Users kakaoUserInfo = new Users();
		//회원 정보 받아오기 (JSON)형태
		try {
			String kakaoUser  =kakaoLogin.getUserProfile(getKakaoToken);

			//받은 정보 parsing 하기
			 JSONParser parser = new JSONParser();
			 JSONObject jsonObj = (JSONObject) parser.parse(kakaoUser);
			 String userId = ((Long)jsonObj.get("id")).toString(); //id 추출하기 /long형->String으로 변환해서 저장
			  
			 //응답 속 kakao_account를 jsonObj 파싱
			 JSONObject kakao_account = (JSONObject) jsonObj.get("kakao_account");
			//kakao_account속 정보들 파싱
			 String userEmail =(String) kakao_account.get("email"); //이메일
			 String birthday =(String)kakao_account.get("birthday"); //생일
			 String userGender = (String) kakao_account.get("gender"); //성별
	
			 //제공되지 않는 것들
//			 String userName = (String)kakao_account.get("name"); //이름
//			 String birthyear = (String)kakao_account.get("birthyear"); //출생연도
//			 String userPhone = (String)kakao_account.get("phone_number"); //연락서

			 //kakao_account속 profile파싱
			 JSONObject profile = (JSONObject) kakao_account.get("profile");
			 
			 //kakao_account>profile 안의 정보 파싱
			 String userNick = (String)profile.get("nickname"); //닉네임
			 String userPhoto = (String)profile.get("profile_image_url"); //프로필 사진
			 
			 
			 logger.info("userId {}",userId);
			 logger.info("userNick {}",userNick);
			 logger.info("userEmail {}",userEmail);
			 logger.info("birthday {}",birthday);
			 logger.info("userGender {}",userGender);
			 logger.info("userPhoto {}",userPhoto);
			 
			 //DTO에 정보 담기
			 kakaoUserInfo.setUserId(userId);
			 kakaoUserInfo.setUserNick(userNick);
			 kakaoUserInfo.setUserEmail(userEmail);
			 kakaoUserInfo.setUserGender(userGender);
			 kakaoUserInfo.setUserPhoto(userPhoto);
		} catch (RestClientException | URISyntaxException | ParseException e) {
			e.printStackTrace();
		}

		logger.info("회원정보 추출 완료 :{}",kakaoUserInfo);
		return kakaoUserInfo;
	}
	@Override
	public boolean isLogin(Users kakaoUserInfo) {
		
		if(loginDao.iskakaoLogin(kakaoUserInfo)>0) {
			logger.info("가입한 적 있음");
			return true;
		}
		logger.info("가입한 적 없음");
		return false;
	}
	
	@Override
	public int getuserNo(Users kakaoUserInfo) {
		return loginDao.selectuserNoForKakao(kakaoUserInfo);
	}
}
