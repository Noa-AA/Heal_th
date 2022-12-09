package yerim.util;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yerim.dto.Msg;
import yerim.dto.SmsRequest;
import yerim.dto.SmsResponse;

public class Sms {
	public final Logger logger = LoggerFactory.getLogger(this.getClass());

		private String accesskey = "r0IdZKsLWez0CewuKvdP";
		private String secretkey = "TiM1B0tHlHV4Pqss0XXSiRfa2MMbrCs7zOGZk6Be";
		private String serviceId="ncp:sms:kr:297034398491:heal_th";
		
		public void sendSms(String userPhone, String numMsg) {
		//문자 메시지  넣기
		List<Msg> sendMsg = new ArrayList<>();
		logger.info("메시지 보내기 시작");
		
		//보낼 메시지 설정
		Msg msg = new Msg();
		msg.setTo(userPhone);
		msg.setContent("Heal_th 인증번호[" + numMsg +"]를 넣어주세요");
		sendMsg.add(msg);
		
		//요청Body설정
		SmsRequest smsRequest = new SmsRequest(); //문자 요청 SmsRequest
		smsRequest.setType("SMS"); //요청 타입
		smsRequest.setContentType("COMM"); //일반문자
		smsRequest.setCountryCode("82"); //국가코드
		smsRequest.setFrom("01035074177"); //보내는 사람 번호
		smsRequest.setContent("Heal_th"); // 기본메시지 내용
		smsRequest.setMessages(sendMsg); //보낼 메시지 정보
		
		
		//요청 BOdy json으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonBody = "";
		try {
			 jsonBody = objectMapper.writeValueAsString(smsRequest);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//시간 설정
		String time = Long.toString(System.currentTimeMillis());
		
		//Header 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("x-ncp-apigw-timestamp", time);  //시간
		headers.set("x-ncp-iam-access-key", accesskey); //accesskey
		headers.set("x-ncp-apigw-signature-v2", makeSignature(time)); //signature는 요청 시간이 같아야함
		
		
		HttpEntity<String> body =new HttpEntity<>(jsonBody,headers);
		RestTemplate restTempalte = new RestTemplate();
		restTempalte.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		
		//응답 설정
		SmsResponse smsResponse = new SmsResponse();
		try { //응답 주소 및 내용, 헤더 설정 ,요청 URL
			smsResponse	= restTempalte.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/"+serviceId+"/messages"),body,SmsResponse.class);
		} catch (RestClientException | URISyntaxException e) {
			e.printStackTrace();
		}
		
		logger.info("문자 보내기 완료");
	}

	public String makeSignature(String time) { // API makeSignature 하기 
		String space = " ";					// one space
		String newLine = "\n";					// new line
		String method = "POST";					// method
		String url = "/sms/v2/services/"+serviceId+"/messages";
		String timestamp = time;
		String accessKey = accesskey;			// access key id (from portal or Sub Account)
		String secretKey = secretkey;
	
		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();
	
		SecretKeySpec signingKey;
		String encodeBase64String ="";
		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		}
	
		
	  return encodeBase64String;
	
	}

}
