package yerim.service.impl;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import yerim.dao.face.LoginDao;
import yerim.dto.Users;
import yerim.service.face.LoginService;
import yerim.util.EmailCode;
import yerim.util.Sms;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired LoginDao loginDao;
	
	
	//이메일 전송을 위한 객체
	@Autowired EmailCode sendCode;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	public boolean checkLogin(Users login) {//로그인을 위한 아이디 확인
		logger.info("checkLogin {}",login);
		
		if(loginDao.selectIdPw(login)>0) {
			logger.info("로그인 정보 조회 성공");
			return true; //로그인 성공
		}
		return false;//로그인 실패
	}

	@Override
	public int getUserNo(Users login) {
		return loginDao.selectUserno(login);
	}
	
	@Override
	public boolean searchUser(Users searchId) {
		logger.info("seearchUser");
		if(loginDao.selectUser(searchId)>0) {
			logger.info("회원 존재 여부확인 성공");
			return true;
		}
		
		return false;
	}
	
	@Override
	public String sendMail(Users searchId) {
		logger.info("sendMail -이메일 인증 보내기 시작");
		String emailCode = sendCode.sendEmailCode(searchId);		
		return emailCode;
	}
	
	
	@Override
	public boolean codeChk(String emailCode, HttpSession session) {
		logger.info("codeChk 실행");
		logger.info("emailCode : {}, session : {}",emailCode, 	session.getAttribute("emailResult"));
		
		//세션에 담긴 번호 
		String sessionCode = (String)session.getAttribute("emailResult");
		
		//세션에 담긴 이름과 이메일 얻기
		Users searchId = new Users();
			searchId.setUserName((String)session.getAttribute("userName"));
			searchId.setUserEmail((String)session.getAttribute("userEmail"));	
		
		logger.info("userName : {}, userEmail :{}",session.getAttribute("userName"),session.getAttribute("userEmail"));
		String getUserId = "";
		if(sessionCode.equals(emailCode)) {
			logger.info("이메일 인증 성공");

			session.removeAttribute(sessionCode);
			return true;
		}else {
			logger.info("인증 실패 코드 불일치");
			getUserId="false";
			logger.info("실패 {}",getUserId);
			return false;
		}
	}
	
	@Override
	public boolean getUsersBySms(Users searchBySms) {
		logger.info("getUserBySms");
		logger.info("이름: {}",searchBySms.getUserName());
		logger.info("전화번호: {}",searchBySms.getUserPhone());
		if(loginDao.selectUserBySms(searchBySms)>0) {
			logger.info("회원 있음");
			return true;
		}
		logger.info("회원 없음");
		return false;
	}
	
	@Override
	public String sendMsessage(Users searchBySms) {
		Random ranNum = new Random();
		
		String msgNum = "";
		//6자리 난수 생성하기
		for( int i=0;i<6;i++) {
				//0~9사이의 난수값 추가하기
			msgNum += Integer.toString(ranNum.nextInt(10));
		}
		
		logger.info("인증번호 생성 : {}", msgNum);
	
		
		//---------네이버 클라우드 플랫폼 호출
		logger.info("네이버 문자 보내기 ");
		Sms sendNum = new Sms();
		//문자 보내는 메소드 호출 
		sendNum.sendSms((String)searchBySms.getUserPhone(),msgNum);
		logger.info("네이버 문자 보내기 끝");
		
		return msgNum;
	}
	@Override
	public String smsCodeChk(String smsCode, HttpSession session) {
		logger.info("smsCodeChk - 아이디 조회해오기");
		
		//세션에 담긴 인증번호
		String sessionSmsCode = (String)session.getAttribute("sendMsg");
		
		//세션에 담긴 회원 이름과 전화번호 ->DTO에 저장하기
		Users searchIdBySms = new Users();
		
			searchIdBySms.setUserName((String)session.getAttribute("userName"));
			searchIdBySms.setUserPhone((String)session.getAttribute("userPhone"));
		
		
		//인증번호 같으면  아이디 조회해오기
		String getUserIdSms = "";
		if(sessionSmsCode.equals(smsCode)) {
			logger.info("문자인증 성공");
			//아이디 조회해오기
			getUserIdSms = loginDao.selectByNamePhone(searchIdBySms);
			
			//세션 지우기
			session.removeAttribute("sendMsg");
			return getUserIdSms;
		}else {
			logger.info("인증 실패 코드 불일치");
			return "false";
		}
	}
	
	@Override
	public String findUserId(Users searchId) {

		logger.info("아이디 찾기 결과 - 아이디 조회하기");
		
		//이메일 인증으로 아이디 찾기
		if(searchId.getUserEmail() != null) {
			String getUserId = loginDao.selectByIdForEamil(searchId);
			logger.info(getUserId);
			
		}
		
		return null;
	}
	
	@Override
	public boolean checkUser(Users searchPw) {
		logger.info("checkUser");
		logger.info("이름 : {},연락처 : {}",searchPw.getUserName(),searchPw.getUserPhone());
		logger.info("생일 {}",searchPw.getUserBirth());
		if(loginDao.selectUserIdForPw(searchPw)>0) {
			logger.info("회원있음");
			return true;
		}
		
		logger.info("회원 없음");
		return false;
	}
	
	@Override
	public String sendMsg(Users searchPw) {
Random ranNum = new Random();
		
		String msgCode = "";
		//6자리 난수 생성하기
		for( int i=0;i<6;i++) {
				//0~9사이의 난수값 추가하기
			msgCode += Integer.toString(ranNum.nextInt(10));
		}
		
		logger.info("인증번호 생성 : {}", msgCode);
		
		//------------네이버 클라우드 플랫폼 호출 
		logger.info("네이버 문자 보내기");
//		Sms sendCode = new Sms();
//		//메소드 호출
//		sendCode.sendSms((String)searchPw.getUserPhone(), msgCode);
		logger.info("네이버 문자 보내기 끝");
		
		return msgCode;
	}
	
	@Override
	public boolean smsCodeForPw(String pwSmsCode, HttpSession session) {
		
		//세션에서 인증번호 
		String sessionSmsCodeForPw = (String)session.getAttribute("codeForPw");
		
		
		//인증번호 검증
		if(sessionSmsCodeForPw.equals(pwSmsCode)) {
			logger.info("문자 인증 성공");
			
			//세션에서 인증번호 지우기
			session.removeAttribute("codeForPw");
			return true;
		}
		
		return false;
	}
	
	@Override
	public boolean chkUsedPw(Users updatePw,HttpSession session) {
		logger.info("chkUsedPw");
		//세션에서 회원 이름과 아이디 ->DTO에 넣기
		updatePw.setUserName( (String) session.getAttribute("userName"));
		updatePw.setUserId( (String) session.getAttribute("userId"));
		updatePw.setUserBirth((String)session.getAttribute("userBirth"));
		
		if(loginDao.selectByPw(updatePw)>0) {
			logger.info("사용중인 비밀번호 임-초기화 불가능");
			return false;
		}
		
		
		logger.info("비밀번호 없음-초기화 가능");
		return true;
	}
	
	@Override
	public boolean setNewPw(Users userUpdatePw, HttpSession session) {

		//세션에서 회원 정보 담아서 DTO에 넣기
		userUpdatePw.setUserName((String)session.getAttribute("userName"));
		userUpdatePw.setUserId((String)session.getAttribute("userId"));
		userUpdatePw.setUserBirth((String)session.getAttribute("userBirth"));
		if(loginDao.updateNewPw(userUpdatePw)>0) {
			logger.info("비밀번호 update -성공");
			return true;
		}
		logger.info("비밀번호 update 실패");
		return false;
	}
		
	
	
}
