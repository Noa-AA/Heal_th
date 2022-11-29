package yerim.controller;

import java.io.IOException;
import java.io.Writer;
import java.net.http.HttpResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import yerim.dto.Users;
import yerim.service.face.LoginService;

@Controller
public class JoinController {
	
	@Autowired LoginService loginService;
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());

	 
	 @GetMapping("/login/join")
	 	public void join() { //회원가입 폼 보여주기
		 logger.info("/login/join [GET]");
	 }
	 @PostMapping("/login/join")
	 	public String joinProc(Users joinInfo){
		 logger.info("/login/join [POST]");
		 
		 
		 logger.info("{}",joinInfo);
		 
		 //전달된 회원가입 정보 insert 하기 
		 loginService.setJoinInfo(joinInfo);
		 
		 return "redirect:/login/login";
		 
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/checkId")
	 public int checkId(Users chkId) {
		 logger.info("login/checkId [POST]");
		 
		 logger.info("{}",chkId);
		 
		 //중복확인 
		 int chkIdResult = loginService.checkById(chkId);
		 
		 return chkIdResult;
	
	 }
}
