package yerim.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yerim.dto.Users;
import yerim.service.face.MypageService;

@Controller  
@RequestMapping("/mypage")
public class MypageController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스
	@Autowired MypageService mypageService;
	
	@RequestMapping("/main")
	public void mypage() {
		logger.info("/mypag/main [GET]");
	}
	
	@GetMapping("/updateInfo")
	public void updateUsersInfo(HttpSession session,Model model) {
		//회원 정보 수정 페이지
		logger.info("/mypage/updateInfo [GET]");
		
		//세션에서 회원 번호 가져오기
		int userNo = (int)session.getAttribute("userNo");
		
		logger.info("회원번호: {}",userNo);
		
		//기존에 작성된 회원 정보 조회해오기
		Users userInfo = mypageService.getuserInfo(userNo);
		logger.info("회원 정보: {}",userInfo);
		
		//회원 주소 처리하기
		String [] address = userInfo.getUserAddress().split(",");
		for(String a :address) System.out.println(a);
		
		
		//조회해온 정보 model값 넘기기
		model.addAttribute("userInfo", userInfo);
		
		//주소 정보만 model값으로 넘기기
		model.addAttribute("address", address);
	}
	
	@PostMapping("/updateInfo")
	public String updateCompleted(HttpSession session,Users userInfo) {
		logger.info("/mypage/updateInfo[POST]");
		
		//수정된 정보 update하기
		mypageService.updateInfo(session,userInfo);
		
		
		return "/mypage/main";
	}
	
	
	@ResponseBody
	@PostMapping("/getEmailCodeForUpdate")
	public String updateEmail(Users userEmail,HttpSession session) {
		logger.info("이메일 보내기");
		//이메일 인증 보내기
		String emailCodeForUpdate = mypageService.sendEmailCode(userEmail);
	
		//인증된 메일 세션에 저장하기
		session.setAttribute("sessionEmailCdoe", emailCodeForUpdate);
		
		logger.info(emailCodeForUpdate);
		return emailCodeForUpdate;
	}
	
	@ResponseBody
	@PostMapping("/chkEmailCdoeForUpdate")
	public boolean chkEmailCode(HttpSession session,String emailCode) {
		
		logger.info("이메일 인증번호 검사하기");
		boolean resultEmailChk = mypageService.chkEmailCode(session,emailCode);
		return resultEmailChk;
	}
	
	@ResponseBody
	@PostMapping("/smsCodeForUpdate")
	public String updatePhone(Users userPhone,HttpSession session) {
		logger.info("문자 인증 보내기");
		
		//문자로 인증번호 보내기
		String smsCodeForUpdate = mypageService.sendSmsCode(userPhone);
		
		//세션에 인증번호 저장
		session.setAttribute("sessionSmSCode", smsCodeForUpdate);
		
		return smsCodeForUpdate;
		
	}
	 @ResponseBody
	 @PostMapping("/chkSmsCode")
	 public boolean chkSmsCode(HttpSession session,String smsCode ) {
		 logger.info("문자로 본인인증하기");
		 
		 //문자 본인인증 검사하기
		 boolean resultSmsChk = mypageService.chkSmsCode(session,smsCode);
		 
		 return resultSmsChk;
	 }
	 
	 
	 //-------비밀번호 바꾸기 (mypage)------
	 @RequestMapping("/updatePw")
	 public void updatePw(HttpSession session,Model model) {
		 logger.info("/mypage/updatePw");
		 
		 //세션에서 유저넘버 추출
		 int userNo = (int)session.getAttribute("userNo");
		 
		 //회원 아이디 조회해오기
		 String userId = mypageService.getuserId(userNo);
		 
		 
		 //아이디 모델값으로 넘겨주기
		 model.addAttribute("userId", userId);
	 }
	 
	 @PostMapping("chkUsingPw")
	 public String chkUsingPw(HttpSession session,Users updatePwInfo,Model model) {
		 logger.info("/mypage/chkUsingPw [POST]");
		 
		 		 
		 //현재 비밀번호와 맞는지 확인하기
		 boolean isUsingPw = mypageService.getuserPw(updatePwInfo,session);
		 
		 if(isUsingPw) {//확인된 비밀번호 일치
			 logger.info("현재 사용중인 비밀번호 일치 - 비밀번호 초기화하기");
			 return "/mypage/setUserPw";
			 
		 }
		
		 //model값으로 false값 넘겨 주기 
		 model.addAttribute("isUsingPw", isUsingPw);
		 return "/mypage/updatePw";
		
		 
	 }
	 
	 @GetMapping("/setUserPw")
	 public void setNewPw() {
		 logger.info("setNewPw [GET]");
	 }

	 
	 @ResponseBody
	@PostMapping("/setUserPw")
	public boolean chkSetNewPw(Users userPw,HttpSession session) {
		 logger.info("/setUserPw [POST]");
		 logger.info("pw : {}",userPw);
		 
		 //현재 사용중인 비밀번호 인지 확인하기
		 boolean chekPw = mypageService.getchkPw(userPw,session);
	
		 logger.info("확인 {}",chekPw);
		 return chekPw;
	 }
	
	 @PostMapping("/setNewPw")
	 public String setNewPw(Users userNewPw,HttpSession session,Model model) {
		 logger.info("비밀번호 update 하기");
		 
		 //비밀번호 재설정
//		 boolean updateResult = mypageService.updateNewPw(userNewPw,session);
		 mypageService.updateNewPw(userNewPw,session);
//		 model.addAttribute("result", updateResult);
		 //업데이트 후 로그인 페이지로 이동
		 return "redirect:/login/login";
	 }
	 
	@GetMapping("/setProfile")
	public void setProfile() {
		logger.info("/setProfile [GET]");
	}
}
