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
		
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
		public void setJoinInfo(Users joinInfo) {
			loginDao.insertJoinInfo(joinInfo);

	}
	
	@Override
	public int checkById(Users chkId) {

		int chkResult = loginDao.selectBychkId(chkId);
		
		return chkResult;
	}
	
}
