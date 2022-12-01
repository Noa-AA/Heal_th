package yerim.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import yerim.dto.Request;
import yerim.dto.SmsResponse;
import yerim.dto.Users;
import yerim.service.face.JoinService;

@Controller
public class JoinController {
	
	@Autowired JoinService joinService;
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
		 joinService.setJoinInfo(joinInfo);
		 
		 return "redirect:/login/login";
		 
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/checkId")
	 public int checkId(Users chkId) {
		 logger.info("login/checkId [POST]");
		 
		 logger.info("{}",chkId);
		 
		 //중복확인 
		 int chkIdResult = joinService.checkById(chkId);
//		 @ResponseBody를 붙인 메소드에서 return한 값은 그대로 AJAX succes함수의 파라미터로 전달
		 return chkIdResult;
	
	 }

	 
	 @ResponseBody
	 @PostMapping("/login/userChk")
	 public String sendMsg(Users userPhone) {
		 logger.info("문자 요청 {}",userPhone.getUserPhone());
		 
		 String message = joinService.sendRan(userPhone);
		 
		 return null;
	 }
}
	
