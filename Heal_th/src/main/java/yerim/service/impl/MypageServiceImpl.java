package yerim.service.impl;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.MypageDao;
import yerim.dto.Users;
import yerim.service.face.MypageService;
import yerim.util.EmailCode;
import yerim.util.Sms;

@Service
public class MypageServiceImpl implements MypageService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//Dao
	@Autowired MypageDao mypageDao;
	
	//이메일 보내기위한 객체
	@Autowired EmailCode emailCode;

	@Override
	public Users getuserInfo(int userNo) {
		logger.info("getuserInfo - userNo :{}",userNo);
		
		return mypageDao.selectUserInfo(userNo);
	}

	@Override
	public String sendEmailCode(Users userEmail) {
		
		return emailCode.sendEmailCode(userEmail);
	}
	@Override
	public boolean chkEmailCode(HttpSession session, String emailCode) {

		//세션에 담긴 코드
		String sessionCdoe = (String)session.getAttribute("sessionEmailCdoe");
		logger.info("session : {}, emailCode : {}",sessionCdoe,emailCode);

		//검증하기
		if(sessionCdoe.equals(emailCode)) {
			logger.info("코드 일치");
			//세션 지우기
			session.removeAttribute("sessionEmailCdoe");
			return true;
		}
		
		logger.info("코드 불일치");
		return false;
	}
	
	@Override
	public String sendSmsCode(Users userPhone) {
		
		Random ranNum = new Random();
		
		String msgNum = "";
		//6자리 난수 생성하기
		for( int i=0;i<6;i++) {
				//0~9사이의 난수값 추가하기
			msgNum += Integer.toString(ranNum.nextInt(10));
		}
		
		logger.info("인증번호 생성 : {}", msgNum);
		
		logger.info("문자 보내기 시작");
//		Sms sms = new Sms();
//		sms.sendSms((String)userPhone.getUserPhone(), msgNum);
		logger.info("문자 보내기 끝");
		
		
		return msgNum;
	}
	@Override
	public boolean chkSmsCode(HttpSession session, String smsCode) {
		logger.info("문자 인증 검증하기");
		
		//세션에 저장된 인증번호 
		String sessionSms = (String)session.getAttribute("sessionSmSCode");
		
		logger.info("세션 : {}, 입력 : {}",sessionSms,smsCode);
		if(sessionSms.equals(smsCode)) {
			logger.info("코드 일치");
			
			//세션지우기
			session.removeAttribute("sessionSmSCode");
			return true;
		}
		
		logger.info("코드 불일치");
		return false;
	}

	@Override
	public void updateInfo(HttpSession session,Users userInfo) {
		
		//성별 바꿔주기 
		
//		if(userInfo.getUserGender() =="여성") {
//			userInfo.setUserGender("F");
//		}else {
//			userInfo.setUserGender("M");
//		}
		
		logger.info("성별 : {}",userInfo.getUserGender());
		//세션에서 userNo 추출하여 DTO에 담기
		userInfo.setUserNo((int)session.getAttribute("userNo"));
		//업데이트하기
		
		mypageDao.updateUserInfo(userInfo);
		
	}
}
