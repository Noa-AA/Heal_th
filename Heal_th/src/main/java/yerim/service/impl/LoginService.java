package yerim.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.LoginDao;

@Service
public class LoginService implements yerim.service.face.LoginService {

	@Autowired LoginDao loginDao;
}
