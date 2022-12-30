package yerim.controller;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;


import changmin.dto.BodyInfo;
import yerim.dto.PhotoFile;
import yerim.dto.Users;
import yerim.service.face.MypageService;

@Controller  
@RequestMapping(value="/mypage")
public class MypageController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스
	@Autowired MypageService mypageService;
	
	@RequestMapping("/main")
	public void mypage(HttpSession session, Model model,PhotoFile profile,BodyInfo bodyInfo) {
		logger.info("/mypag/main [GET]");
		
		//회원 프로필 사진 조회해오기
		PhotoFile profilePhoto = mypageService.getPhoto(session,profile);
		logger.info("프로필 {}",profilePhoto);
		
		//한줄 소개 조회해오기
		Users userIntro = mypageService.getIntro(session);
		logger.info("한술 소개 : {}",userIntro);
		
		//g회원 키 조회해오기
		BodyInfo height = mypageService.getHeigiht(session,bodyInfo);
		logger.info("회원 키 {}",height);

		//모델값으로 storedName 전달하기
		model.addAttribute("storedName", profilePhoto);
		//모델값으로 한줄 소개 전달하기
		model.addAttribute("userIntro", userIntro);
		//모델값으로 키 전달하기
		model.addAttribute("bodyInfo", height);

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
		
		
		return "redirect:/mypage/main";
	}
	
	
	@ResponseBody
	@PostMapping("/getEmailCodeForUpdate")
	public boolean updateEmail(Users userEmail,HttpSession session) {
		logger.info("이메일 보내기");
		//이메일 인증 보내기
		String emailCodeForUpdate = mypageService.sendEmailCode(userEmail);
	
		if(emailCodeForUpdate != null) {
			
			//인증된 메일 세션에 저장하기
			logger.info(emailCodeForUpdate);
			session.setAttribute("sessionEmailCdoe", emailCodeForUpdate);
			return true;
		}
		return false;
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
	public boolean updatePhone(Users userPhone,HttpSession session) {
		logger.info("문자 인증 보내기");
		
		//문자로 인증번호 보내기
		String smsCodeForUpdate = mypageService.sendSmsCode(userPhone);
		if(smsCodeForUpdate != null) {
			
			//세션에 인증번호 저장
			session.setAttribute("sessionSmSCode", smsCodeForUpdate);
			return true;
		}
		return false;
		
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
	 
	 @ResponseBody
	 @PostMapping("chkUsingPw")
	 public boolean chkUsingPw(HttpSession session,Users updatePwInfo) {
		 logger.info("/mypage/chkUsingPw [POST]");
		 logger.info("전달받은 아이디/비밀번호 : {}",updatePwInfo);
		 		 
		 //현재 비밀번호와 맞는지 확인하기
		 boolean isUsingPw = mypageService.getuserPw(updatePwInfo,session);
		logger.info("현재 사용중인 비밀번호 조회 결과 : {}",isUsingPw);
		return isUsingPw;
		 
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
		 mypageService.updateNewPw(userNewPw,session);
		 
		 logger.info("비밀번호 설정 완료 ");
		 //업데이트 후 로그인 페이지로 이동
		 return "redirect:/login/login";
	 }
	 
	@GetMapping("/setProfile")
	public void setProfile() {
		logger.info("/setProfile [GET]");
	}
	
	@PostMapping("/setProfile")
	public String fileup(HttpSession session, MultipartFile userPhoto,PhotoFile photoFile,Users intro ) {
		logger.info("{}",userPhoto);
		
		//작성자 정보 추가
		photoFile.setUserNo((int)session.getAttribute("userNo"));
		intro.setUserNo((int)session.getAttribute("userNo"));
		
		//첨부파일 처리
		mypageService.upload(userPhoto,photoFile);
		
		//한줄 소개 처리
		mypageService.uploadIntro(intro);
	
		return "redirect:/mypage/main";
	}
	

	@GetMapping("/dropOut")
	public void userDropOut() {
		logger.info("dropOut [GET]");
	}
	
	@PostMapping("/dropOut")
	public String dropOutExe(HttpSession session, Users dropOut,Model model) {
		logger.info("/mypage/dropOutExe [POST]");
		
		
			
		//입력된 유저번호 맞는지 확인처리
		boolean resultDrop = mypageService.getchkPw(dropOut, session);
		
		logger.info("비밀번호 일치 여부 {}",resultDrop);
		
		if(!resultDrop) { //false = 비밀번호 일치
			mypageService.dropOtuExe(dropOut); //회원 탈퇴하기
			session.invalidate();  			//세션 지우기
			return "redirect:/login/login";
		}else { //비밀번호 불일치
			//모델값 전달
			model.addAttribute("resultDrop", resultDrop);
			return "/mypage/dropOut";
		}
		
	}
	@ResponseBody
	@PostMapping("/updateBodyInfo")
	public BodyInfo  updateWeight(HttpSession session,BodyInfo bodyInfo) {

		logger.info("/updateWeight [POST]");
		logger.info("bodyInfo {}", bodyInfo);
		
		//세션에서 userNo ->가져오기
		bodyInfo.setUserNo((int)session.getAttribute("userNo"));
		mypageService.setBodyInfo(bodyInfo);	
		
		return bodyInfo;
	
		
	}
	
	
	@ResponseBody
	@PostMapping("/sendData")
	public List<BodyInfo> infoData (HttpSession session, BodyInfo info) {
		//그래프 작성을 위한 자료 조회하기
		List<BodyInfo> weightList = mypageService.getBodyList(info,session);
		for(BodyInfo list : weightList) logger.info("list {}", list);
		
		logger.info("list {}",weightList);
		
		return weightList;
	}
	
	@GetMapping("/logout")
	public String logOut(HttpSession session) {
		
		//로그아웃하기
		session.invalidate();
		
		return "redirect:/login/login";
		
		
	}
}
