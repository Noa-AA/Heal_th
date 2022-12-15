package yerim.service.impl;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		Sms sms = new Sms();
		sms.sendSms((String)userPhone.getUserPhone(), msgNum);
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
		
		logger.info("성별 : {}",userInfo.getUserGender());
		//세션에서 userNo 추출하여 DTO에 담기
		userInfo.setUserNo((int)session.getAttribute("userNo"));
		//업데이트하기
		
		mypageDao.updateUserInfo(userInfo);
		
	}
	
	@Override
	public String getuserId(int userNo) {
		logger.info("getuserId - 회원 아이디 조회");
		return mypageDao.selectUserId(userNo);
	}
	
	@Override
	public boolean getuserPw(Users updatePwInfo, HttpSession session) {
		logger.info("getuserPw");
		//세션에 저장된 유저번호 DTO에 담기 
		logger.info("session {}", session.getAttribute("userNo"));
		updatePwInfo.setUserNo((int)session.getAttribute("userNo"));
		
		if(mypageDao.selectuserPw(updatePwInfo)>0) {
			logger.info("비밀번호 일치");
			return true;
		}
		
		logger.info("비밀번호 불일치");
		return false;
	}
	@Override
	public boolean getchkPw(Users userPw, HttpSession session) {

		//세션에 있는 유저번호 DTO에 담기
		userPw.setUserNo((int)session.getAttribute("userNo"));
		
		if(mypageDao.selectUserPwForNewPw(userPw)>0) {
			logger.info("현재 사용중인 비밀번호 ");
			return false;
		}
		
		logger.info("현재 사용중이지 않은 비밀번호 ");
		return true;
	}
	@Override
		public void updateNewPw(Users userNewPw, HttpSession session) {
		
		logger.info("updateNewPw");
		//세션에 있는 유저번호 DTO에 담기
		userNewPw.setUserNo((int)session.getAttribute("userNo"));
		//비밀번호 update
		mypageDao.updateUserNewPw(userNewPw);
		
	}
}
