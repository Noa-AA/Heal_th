package yerim.controller;

import javax.servlet.http.HttpSession;

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
		 
		 return "redirect:/login/joinComplete";
		 
	 }
	 
	 @GetMapping("/login/joinComplete")
	 public void loginComplete(){
		 logger.info("로그인 성공");
		 
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
	 public	 String sendMsg(Users userPhone,HttpSession session) {
		 logger.info("문자 요청 {}",userPhone.getUserPhone());
		 
		 //문자 요청
		 String message = joinService.sendRan(userPhone,session);
		 logger.info("{}",message);
		 
		 //인증번호 세션에 저장
		 session.setAttribute("message", message);
			
		 //문자요청 응답 반환
		 return message;
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/codeChk")
	 public boolean codeChk(HttpSession session,String code) {
		logger.info("code: {}, session: {}",code,session.getAttribute("numMsg"));
		//본인인증 번호 확인하기
		boolean confirm = joinService.checkCode(session,code);
		return confirm ;
	 }
	
	 
}
	
