package yerim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import yerim.service.face.LoginService;

@Controller
public class LoginController {
 @Autowired LoginService loginService;
	


}
