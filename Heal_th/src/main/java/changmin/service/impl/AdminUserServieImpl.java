package changmin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.dao.face.AdminUserDao;
import changmin.service.face.AdminUserService;
import daeyeon.service.impl.AdminUserServiceImpl;
import yerim.dto.Users;

@Service
public class AdminUserServieImpl implements AdminUserService {

	private Logger logger = LoggerFactory.getLogger(AdminUserServiceImpl.class);

	@Autowired AdminUserDao adminUserDao;
	
	@Override
	public List<Users> getUserList() {

		return adminUserDao.selectUserList();
	}
	
}
