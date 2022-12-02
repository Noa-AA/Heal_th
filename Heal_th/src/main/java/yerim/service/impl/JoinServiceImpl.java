package yerim.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yerim.dao.face.JoinDao;
import yerim.dto.Msg;
import yerim.dto.SmsRequest;
import yerim.dto.SmsResponse;
import yerim.dto.Users;
import yerim.service.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService {
		
	@Autowired JoinDao loginDao;
		
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	private String accesskey = "r0IdZKsLWez0CewuKvdP";
	private String secretkey = "TiM1B0tHlHV4Pqss0XXSiRfa2MMbrCs7zOGZk6Be";
	private String serviceId="ncp:sms:kr:297034398491:heal_th";
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
	public SmsResponse sendRan(Users userPhone,HttpSession session){
		
		//난수 생성하기
		Random ran = new Random();
		String numMsg ="";
		//6자리의 난수 생성하기
		for(int i=0;i<6;i++) {
			//0~9사의 난수값을 numMsg에 추가하기
			numMsg += Integer.toString(ran.nextInt(10));
		}
		logger.info("회원 문자 인증 숫자 " + numMsg);
		
		//세션에 인증번호 저장하기
		 session.setAttribute("numMsg", numMsg);
		
		 
		//네이버 클라우드 플랫폼 API 연결하기----------------------------------------
		
		//문자 메시지  넣기
		List<Msg> sendMsg = new ArrayList<>();
		logger.info("메시지 보내기 시작");
		
		//보낼 메시지 설정
		Msg msg = new Msg();
		msg.setTo(userPhone.getUserPhone());
		msg.setContent("Heal_th 가입을 위한 인증번호 [" + numMsg +"]를 넣어주세요 ");
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
		try { //응답 주소 및 내용, 헤더 설정 
			smsResponse	= restTempalte.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/"+serviceId+"/messages"),body,SmsResponse.class);
		} catch (RestClientException | URISyntaxException e) {
			e.printStackTrace();
		}
		
		logger.info("문자 보내기 완료");
		return smsResponse;
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

	@ResponseBody
	@Override
	public boolean checkCode(HttpSession session, String code) {
		
		//세션에 담긴 인증번호
		String numMsg =(String) session.getAttribute("numMsg");
		
		
		
		if(numMsg.equals(code)) {
			logger.info("본인인증 성공");
			session.removeAttribute(numMsg);
			return true;
		} else {
			
			logger.info("본인인증 실패");
			return false;
		}
		
	}
}
