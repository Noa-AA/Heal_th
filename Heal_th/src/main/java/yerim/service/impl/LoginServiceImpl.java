package yerim.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.LoginDao;
import yerim.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
@Autowired LoginDao loginDao;
	
	
}
