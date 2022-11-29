package yerim.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import yerim.service.face.LoginService;

@Controller
public class LoginController {
 private final Logger logger = LoggerFactory.getLogger(this.getClass());

 @Autowired LoginService loginService;
 
 @GetMapping("/login/login")
 public void login() {
	 //로그인 화면 
	 logger.info("/login/login [GET]");
 }
 

}
