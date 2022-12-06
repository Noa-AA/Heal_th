package yerim.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.LoginDao;
import yerim.dto.Users;
import yerim.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired LoginDao loginDao;
	
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
}
