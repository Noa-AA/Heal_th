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
	
}
