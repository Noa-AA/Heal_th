package yerim.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.AdminLoginDao;
import yerim.dto.Admin;
import yerim.service.face.AdminLoginService;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired AdminLoginDao adminLoginDao;
	
	@Override
	public boolean isLogin(Admin admin) {
		if(adminLoginDao.chkLogin(admin)>0) {
			logger.info("로그인 성공");
			return true;
		}
		
		logger.info("로그인 실패");		
		return false;
	}
	
	
	@Override
	public int getadminNo(Admin admin) {
		logger.info("getadmin No");
		return adminLoginDao.selectAdminNo(admin);
	}
	
}
