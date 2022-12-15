package yerim.service.impl;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.MypageDao;
import yerim.dto.Users;
import yerim.service.face.MypageService;
import yerim.util.EmailCode;

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
		String sessionCdoe = (String)session.getAttribute("sessionEmailCode");
		logger.info("session : {}, emailCode : {}",sessionCdoe,emailCode);

		//검증하기
		if(sessionCdoe.equals(emailCode)) {
			logger.info("코드 일치");
			return true;
		}
		
		logger.info("코드 불일치");
		return false;
	}
}
