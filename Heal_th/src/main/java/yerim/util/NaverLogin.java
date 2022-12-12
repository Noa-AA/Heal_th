package yerim.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpConnection;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import yerim.dto.Naver;

public class NaverLogin {
	public final Logger logger = LoggerFactory.getLogger(this.getClass());

 	private final static String CLIENTID="3hffBOgRGmclmhYQtUOc";
 	private final static String CLIENTSECRET ="q8xZKMDbqO";
 	private final static String REDIRECTURI = "http://localhost:8888/login/naverLogin";
	
	
	public String generateURL(HttpSession session) {
		logger.info("요청 URL 생성");
		// CSRF 방지를 위한 상태 토큰 생성 코드
		// 상태 토큰은 추후 검증을 위해 세션에 저장되어야 한다.
		try {
			String redirect_uri = URLEncoder.encode(REDIRECTURI,"UTF-8");
		
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		String requestURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
				+"&client_id=" +CLIENTID
				+"&redirect_uri=" + REDIRECTURI
				+"&state="+ state;
		
		// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
		session.setAttribute("state", state);
		
		return requestURL;
	
	}


	public String getAccessToken(String storedStated, String state, String code) {
		
			logger.info("getAccessToken 시작");
		
//			//HTTPHeader 생성
//			HttpHeaders headers = new HttpHeaders();
//			headers.add("Contect-type","application/x-www-form-urlencoded;charset=utf-8");
//			
//			//HTTP BODY 생성
//			MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//			body.add("grant_type", "authorization_code");
//			body.add("client_id", CLIENTID);
//			body.add("client_secre", CLIENTSECRET);
//			body.add("redirect_uri", REDIRECTURI);
//			body.add("state",state);
//			body.add("code", code);
//			
//			//HTTP 요청 보내기
//			HttpEntity<MultiValueMap<String, String>> naverTokenRequest = new HttpEntity<>(body, headers);
//			RestTemplate restTemplate = new RestTemplate();
//			
//			ResponseEntity<String> response = restTemplate.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.GET,naverTokenRequest,String.class);
//			
//			
//			//http 응답(JSON> ->액세스 토큰 파싱
//			String responseBody = response.getBody();
//			ObjectMapper objMapper = new ObjectMapper();
//			JsonNode jsonNode = objMapper.readTree(responseBody);
//			
//			String access_token =  jsonNode.get("access_token").toString();
//			return access_token;
		
			
		
		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
				   + "&client_id=" +CLIENTID
			        + "&client_secret=" +CLIENTSECRET
			        + "&redirect_uri=" +REDIRECTURI
			        + "&code=" +code
			        + "&state=" +state;
		  String accessToken = "";
		    String refresh_token = "";
		    StringBuilder res = new StringBuilder();
		    int responseCode =0;
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		       responseCode = con.getResponseCode();
		      BufferedReader br;
		      if (responseCode == 200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		    
		    } catch (Exception e) {
		      // Exception 로깅
		    }
					
		    if (responseCode == 200) {
		    	//access_token 파싱하기 
		    	
		    	try {
		    		JSONParser parser = new JSONParser();
					Object obj = parser.parse(res.toString());
					JSONObject jsonObj = (JSONObject) obj;
					//json ->스트링 파싱
					accessToken =(String)jsonObj.get("access_token");
				} catch (ParseException e) {
					e.printStackTrace();
				}
		    	
		        return accessToken;
		    }
		    
		    return null;
	}
	
	
	
	public String getnaverUserInfo(String accessToken) {
		
		//Strin 형식의 apiReulst Json으로 변경
		
		logger.info("토큰토큰 {}",accessToken);
		String header ="Bearer " + accessToken; 
		logger.info("header {}",header);
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		requestHeaders.put("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		String responseBody = get(apiURL,requestHeaders);
//			
//		
		
//		//HTTP Header 생성
//		HttpHeaders headers= new HttpHeaders();
//		headers.add("Authorization", "Bearer"+acces);
		logger.info("responseBody {}",responseBody);
		return responseBody;
		
	}


	private String get(String apiURL, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiURL);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {//정상 호출
					return readBody(con.getInputStream());
				
			}else {//에러 발생
				return readBody(con.getErrorStream());
				
			}
			
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		}finally{
			con.disconnect();
		}
		
		
	}

	private HttpURLConnection connect(String apiURL) {
		
		try {
			URL url = new URL(apiURL);
			
			return (HttpURLConnection)url.openConnection();
			
		} catch (MalformedURLException e) {
		    throw new RuntimeException("API URL이 잘못되었습니다. : " + apiURL, e);
		} catch (IOException e) {
		throw new RuntimeException("연결이 실패했습니다. : " + apiURL, e);

		}
		
	}

	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try(BufferedReader lineReader = new BufferedReader(streamReader)){
			StringBuilder responseBody= new StringBuilder();
			String line;
			
			while((line = lineReader.readLine())!=null){		
				responseBody.append(line);
				}
				logger.info(responseBody.toString());
				return responseBody.toString();
			} catch (IOException e) {
				throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
			} 
		
		
	}


	
	
	
}
