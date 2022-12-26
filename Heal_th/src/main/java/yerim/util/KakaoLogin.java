package yerim.util;


import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import yerim.dto.Users;

public class KakaoLogin {
	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	private final static String CLIENTID="384b6c0821163d9e4d026d0bbeb0d76e";
	private final static String REDIRCTURL ="http://localhost:8888/login/kakaoLogin";
	private RestTemplate restTempalte = new RestTemplate();
	
	
	public String generateKakaoURL() {
		logger.info("카카오 요청 URL생성");
		String requestURL = "https://kauth.kakao.com/oauth/authorize?response_type=code"
					+"&client_id="+CLIENTID
					+"&redirect_uri="+REDIRCTURL;
//					+"&scope=profile_nickname,profile_image,account_email,gender,birthday";
		
		return requestURL;
	}


	public String getaccessToken(String code) throws RestClientException, URISyntaxException {
		logger.info("토큰 요청하기");

		//토큰 요청
		
		
		//헤더 설정
		HttpHeaders headers = new HttpHeaders();
		//Content-Type: application/x-www-form-urlencoded" 설정
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		
		//요청 url 설정
		String apiURL = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code"
					+"&client_id="+CLIENTID
					+"&redirect_uri="+REDIRCTURL
					+"&code="+code;
		
		
		//요청 
		HttpEntity<String> request = new HttpEntity<>(headers);
		restTempalte.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		logger.info("토큰 요청 완료");
	
		//HTTP POST 요청 및 응답
		ResponseEntity<String> response = restTempalte.postForEntity(new URI(apiURL), request, String.class);
		
		String access_token ="";
		if(response.getStatusCode() == HttpStatus.OK) {
			
			logger.info("요청 완료 -토큰 받기");
			
			try {//access_Toketn만 파싱
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject)parser.parse(response.getBody());
			
				access_token = (String) obj.get("access_token");
			
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			logger.info("발행된 토큰 {}",access_token);
			return access_token;
		}
		
		return "error";
		
	}


	public String getUserProfile(String getKakaoToken) throws RestClientException, URISyntaxException {
		logger.info("접근 토큰으로 회원 정보 요청하기");
		
		//요청할 URL
		String apiURL = "https://kapi.kakao.com/v2/user/me";
//			+"&Authorization=Bearer "+getKakaoToken;
		
		//헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.set("Authorization", "Bearer "+getKakaoToken);
		
		HttpEntity<String> requestInfo = new HttpEntity<>(headers);
		restTempalte.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		
		//HTTP POST 요청 및 응답
		ResponseEntity<String> response=restTempalte.postForEntity(new URI(apiURL), requestInfo, String.class);
		logger.info("회원 정보 받기 {}",response);
		
		String userInfo = "";
		if(response.getStatusCode() == HttpStatus.OK) {
			userInfo = response.getBody();
		}
		
		return userInfo;
	}	
	
	
	
	
}


