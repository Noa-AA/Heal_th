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
import yerim.util.Sms;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired LoginDao loginDao;
	
	//이메일 전송을 위한 객체
	@Autowired JavaMailSender mailSender;
	
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
		

		
		
		//인증을 위한 인증번호 생성(숫자 + 문자)
		Random ran = new Random();
		
		StringBuffer emailCode = new StringBuffer();
		
		
		//10 자리 난수 생성하기
		for( int i=0;i<10;i++) {
			if(ran.nextBoolean()) {
				//알파벳 수 = 26 아스키코드 영어 대문자 : 65~90/소문자 97~122
				emailCode.append((char)((int)ran.nextInt(26)+65));
			}else {
				//0~9숫가 넣기 
				emailCode.append(ran.nextInt(10));
			}
			
			logger.info(null);
		}

		//이메일 보내기
		
		String from ="yerim_nam@naver.com"; //보내는 사람 메일 주소
		String to = searchId.getUserEmail(); //받는 사람 메일 주소(사용자가 입력한 메일 주소)
		String title ="[Heal_th] 아이디 찾기 이메일 입니다.";
		String content =
				searchId.getUserName()+"님의 아이디 찾기를 위한 인증 번호 입니다."
				+"<br><br>"
				+"인증 번호는"+ emailCode+"입니다."
				+"<br>"
				+"해당 인증번호를 인증번호 확인란에 기입하여 주세요";
		
			
		try {
			MimeMessage emailMsg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(emailMsg,true,"UTF-8");
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(emailMsg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		logger.info("이메일 보내기 완료  : {}",emailCode);
		return emailCode.toString();
		
	}
	
	
	@Override
	public String codeChk(String emailCode, HttpSession session) {
		logger.info("codeChk 실행");
		logger.info("emailCode : {}, session : {}",emailCode, 	session.getAttribute("emailResult"));
		
		//세션에 담긴 번호 
		String sessionCode = (String)session.getAttribute("emailResult");
		
		//세션에 담긴 이름과 이메일 얻기
		Users searchId = new Users();
			searchId.setUserName((String)session.getAttribute("userName"));
			searchId.setUserEmail((String)session.getAttribute("userEmail"));	
		
		logger.info("userName : {}, userEmai :{}",session.getAttribute("userName"),session.getAttribute("userEmail"));
		String getUserId = "";
		if(sessionCode.equals(emailCode)) {
			logger.info("이메일 인증 성공");
			//인증 성공 시 아이디 조회해오기
			getUserId = loginDao.selectById(searchId);
			logger.info(getUserId);
			return getUserId;
		}else {
			logger.info("인증 실패 코드 불일치");
			getUserId="false";
			logger.info("실패 {}",getUserId);
			return "false";
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
		sendNum.sendSms(searchBySms.getUserPhone(),msgNum);
		
		logger.info("네이버 문자 보내기 끝");
		
		return msgNum;
	}
	@Override
	public String smsCodeChk(String smsCode, HttpSession session) {
		logger.info("smsCodeChk - 아이디 조회해오기");
		String getId ="";
		
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
			return getUserIdSms;
		}else {
			logger.info("인증 실패 코드 불일치");
			return "false";
		}
		
		
	}
}
