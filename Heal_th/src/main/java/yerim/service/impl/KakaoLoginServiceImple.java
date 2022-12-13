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

			 //id 추출하기
			 String userId = (String)jsonObj.get("id");
			 
			 //응답 속 kakao_account를 jsonObj 파싱
			 JSONObject kakao_account = (JSONObject) jsonObj.get("kakao_account");
			 //kakao_account속 profile파싱
			 JSONObject profile = (JSONObject) kakao_account.get("profile");
			 //kakao_account>profile 안의 정보 파싱
			 String userNick = (String)profile.get("nickname");
			 String userPhoto = (String)profile.get("profile_image_url");
			
		
		} catch (RestClientException | URISyntaxException | ParseException e) {
			e.printStackTrace();
		}
		
		
		return kakaoUserInfo;
	}
}
