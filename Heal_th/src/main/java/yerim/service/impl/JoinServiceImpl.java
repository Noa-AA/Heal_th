package yerim.service.impl;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import yerim.dao.face.JoinDao;
import yerim.dto.Users;
import yerim.service.face.JoinService;
import yerim.util.Sms;

@Service
public class JoinServiceImpl implements JoinService {
		
	@Autowired JoinDao joinDao;
		
	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
		public void setJoinInfo(Users joinInfo) {
		joinDao.insertJoinInfo(joinInfo);

	}
	
	@Override
	public int checkById(Users chkId) {

		int chkResult = joinDao.selectBychkId(chkId);
		logger.info("아이디중복체크 {}",chkResult);
		
		return chkResult;
	}
	
	@Override
	public String sendRan(Users userPhone,HttpSession session){
		
		
		//난수 생성하기
		Random ran = new Random();
		String numMsg ="";
		//6자리의 난수 생성하기
		for(int i=0;i<6;i++) {
			//0~9사의 난수값을 numMsg에 추가하기
			numMsg += Integer.toString(ran.nextInt(10));
		}
		logger.info("회원 문자 인증 숫자 " + numMsg);
		
		 
		 
		//네이버 클라우드 플랫폼 호출----------------------------------------
		logger.info("네이버 문자 보내기 ");
		Sms send = new Sms();
		send.sendSms(userPhone.getUserPhone().toString(),numMsg);
		
		logger.info("네이버 문자 보내기 끝");
		return numMsg;
	
	}

	@ResponseBody
	@Override
	public boolean checkCode(HttpSession session, String code) {
		
		//세션에 담긴 인증번호
		String numMsg =(String) session.getAttribute("message");
		
		
		
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
