package yerim.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import yerim.dto.Users;
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

 
 @PostMapping("/login/login")
 public String loginProc(Users login, HttpSession session, Model model) {
	 logger.info("/login/login [POST]");
	 
	 logger.info("login정보 id : {},pw : {}",login.getUserId(),login.getUserPw());
	 
	 
	 //아이디 확인하기 
	 boolean isLogin = loginService.checkLogin(login);
	 
	 if(isLogin) {
		 
		 logger.info("login성공");
		 session.setAttribute("userNo", login.getUserNo());
	 }else { //로그인 실패
		 logger.info("로그인 실패");
		 model.addAttribute("isLogin", isLogin);
		 session.invalidate();
		 return "/login/login";
	 }
	 
	 //아이디가 있을 때 
	 return "redirect:/main";
	 
	 
	 
	 
 }

}
