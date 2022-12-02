package yerim.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yerim.dao.face.JoinDao;
import yerim.dto.Msg;
import yerim.dto.Request;
import yerim.dto.SmsRequest;
import yerim.dto.SmsResponse;
import yerim.dto.Users;
import yerim.service.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService {
		
	@Autowired JoinDao loginDao;
		
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	private String accesskey = "r0IdZKsLWez0CewuKvdP";
	private String secretKey = "TiM1B0tHlHV4Pqss0XXSiRfa2MMbrCs7zOGZk6Be";
	@Override
		public void setJoinInfo(Users joinInfo) {
			loginDao.insertJoinInfo(joinInfo);

	}
	
	@Override
	public int checkById(Users chkId) {

		int chkResult = loginDao.selectBychkId(chkId);
		
		return chkResult;
	}
	
	@Override
	public String sendRan(Users userPhone){
		String accessKey ="r0IdZKsLWez0CewuKvdP";
		String secretKey="TiM1B0tHlHV4Pqss0XXSiRfa2MMbrCs7zOGZk6Be";
		String serviceId="ncp:sms:kr:297034398491:heal_th";
		String time = Long.toString(System.currentTimeMillis());
		
		//난수 생성하기
		Random ran = new Random();
		String numMsg ="";
		//6자리의 난수 생성하기
		for(int i=0;i<6;i++) {
			//0~9사의 난수값을 numMsg에 추가하기
			numMsg += Integer.toString(ran.nextInt(10));
		}
		logger.info("회원 문자 인증 숫자 " + numMsg);
		
		//네이버 클라우드 플랫폼 API 연결하기
		
		//문자 메시지  넣기
		List<Msg> sendMsg = new ArrayList<>();
		
		//보낼 메시지 설정
		Msg msg = new Msg();
		msg.setTo(userPhone.getUserPhone());
		msg.setContent("Heal_th 가입을 위한 인증번호 [" + numMsg +"] ");
		sendMsg.add(msg);
		
		//요청Body설정
		SmsRequest smsRequest = new SmsRequest();
		smsRequest.setType("SMS");
		smsRequest.setContentType("COMM");
		smsRequest.setCountryCode("82");
		smsRequest.setFrom("01035074177");
		smsRequest.setContent("[Heal_th]");
		smsRequest.setMessages(sendMsg);
		
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String jsonBody = objectMapper.writeValueAsString(smsRequest);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		//Header
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("x-ncp-apigw-timestamp", time);
		headers.set("x-ncp-iam-access-key", accessKey);
		headers.set("", numMsg);
		
		return numMsg;
	}
	public String makeSignature() {
		String space = " ";					// one space
		String newLine = "\n";					// new line
		String method = "GET";					// method
		String url = "/photos/puppy.jpg?query1=&query2";	// url (include query string)
		String timestamp = "{timestamp}";			// current timestamp (epoch)
		String accessKey = "{accessKey}";			// access key id (from portal or Sub Account)
		String secretKey = "{secretKey}";

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
