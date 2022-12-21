package yerim.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import yerim.dto.Users;
import yerim.service.face.KakaoLoginService;
import yerim.service.face.LoginService;
import yerim.service.face.NaverLoginService;
import yerim.util.NaverLogin;

@Controller
public class LoginController {
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LoginService loginService; 

	//네이버 로그인 서비스
	@Autowired NaverLoginService naverLoginService;
	
	//카카오 로그인 서비스 
	@Autowired KakaoLoginService kakaoLoginService;
	
	 @GetMapping("/login/login")
	 public void login(Model model,HttpSession session,HttpServletRequest request) {
		 //로그인 화면 
		 logger.info("/login/login [GET]");
		 
		 //네이버 로그인을 위한 URL  호출 
		 String naverURL = naverLoginService.getURL(session);
		 logger.info(naverURL);
		 
		 //카카오 로그인을 위한 URL 호출
		 String kakaoURL = kakaoLoginService.getURL();
		
		 
		 
		 
		 
		 //모델값으로 URL전달
		 model.addAttribute("naverURL", naverURL);
		 model.addAttribute("kakaoURL", kakaoURL);
		 
		
	 
	 }

 
	 @PostMapping("/login/login")
	 public String loginProc(Users login, HttpSession session, Model model,String saveId, HttpServletResponse response) {
		 logger.info("/login/login [POST]");
		 logger.info("체크박스 확인 {}",saveId); //체크시 on , 아니면 null
		 //아이디 확인하기 
		 boolean isLogin = loginService.checkLogin(login);
		 //쿠키 생성
		 Cookie cookie =  null; //세션에 유저 아이디 저장하기
		 
		 if(isLogin) {//로그인 성공시
			 logger.info("login성공");
			 //userNo조회 해오기
			 int userNo = loginService.getUserNo(login);
			 //userNo 세션에 저장
			 session.setAttribute("userNo", userNo);
			 session.setAttribute("userId", login.getUserId());
			 
			 
			 //아이디 저장 체크 여부에 따라 저장하기
			 if(saveId != null) {//쿠키에 아이디 저장하기
				 cookie = new Cookie("userId",login.getUserId());	
				 cookie.setMaxAge(60*60*24*30); //쿠키의 생존 기간 1개월
			 }else {
				 cookie = new Cookie("userId", "");
				 cookie.setMaxAge(0);
				 
			 }
			
			 //dmdekqdp 쿠키값 저장
			 response.addCookie(cookie);
			 logger.info("userNo : {}. userId : {}",session.getAttribute("userNo"),session.getAttribute("userId"));
			
			 
			 //아이디가 있을 때 
			 return "redirect:/main";
			 
		 }else { //로그인 실패 시
			 logger.info("로그인 실패");
			 model.addAttribute("isLogin", isLogin);
			 session.invalidate();
			 return "/login/login";
		 }
		 
		
		 
	 }
	 
	 @RequestMapping("/login/searchId")
	 public void searchId() {
		 logger.info("/login/searchId");
		 
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/searchId")
	 public boolean searchIdProc(Users searchId,HttpSession session) {
		 logger.info("/login/serachId [POST]");
		 logger.info("이름:{},email:{}",searchId.getUserName(),searchId.getUserEmail());
		 
		 
		 //입력한 이메일주소와 이름이 일치한 회원이 있는지 조회하기
		 
		 boolean searchUser = loginService.searchUser(searchId);
		 
		 if(searchUser) {//회원이 있다면 인증 메일 보내기 

			 //세션에 정보 저장(입력한 정보-이메일,이름)
			 String emailResult = loginService.sendMail(searchId);
			 session.setAttribute("userName",searchId.getUserName());
			 session.setAttribute("userEmail",searchId.getUserEmail());
			 
			 //세션에 이메일 인증 코드 저장
			 logger.info("session 코드 : {}",emailResult);
			 session.setAttribute("emailResult", emailResult);
			 
			 return true; //true 전달
		 } 
			 //회원이 없을 때 세션 삭제 이후 처리는 jsp에서 함
			 logger.info("회원 없음");
			return false; //false 전달 
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/codeIdChk")
	 public String codeIdChk(String emailCode,HttpSession session,Model model) {
		 
		 logger.info("/codeIdChk 실행");
		 
		 String searchId =loginService.codeChk(emailCode,session);
		 logger.info(searchId);
		 return searchId;
	 }
	 
	 @RequestMapping("/login/searchIdResult")
	 public void ResultsearchId() {
		 	logger.info("아이디 찾기 완료");
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/searchIdBySms")
	 public boolean searchIdBySms(Users searchBySms,HttpSession session) {
		 logger.info("/login/serachIdBySms");
		 //입력된 정보로 회원이 존재하는지 조회해오기
		 boolean isUser = loginService.getUsersBySms(searchBySms);
		 if(isUser) {
			 //회원이 있으면 문자 보내기 
			 logger.info("회원 있음 - 문자 보내기");
			 String sendMsg = loginService.sendMsessage(searchBySms);
			 //회원 정보 세션에 저장
			 session.setAttribute("userName",searchBySms.getUserName());
			 session.setAttribute("userPhone",searchBySms.getUserPhone());
			 //세션에 인증 번호 저장
			 session.setAttribute("sendMsg", sendMsg);
			 
			 return true;
		 }
			 logger.info("회원 없음 인증 실패");
			 return false;
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/checkSmsCode")
	 public String smsCodeChk(String smsCode,HttpSession session) {
		 logger.info("/login/chedkSmScode");
		 
		 String searchBySms = loginService.smsCodeChk(smsCode,session);
		 
		 logger.info("아이디 찾기 성공 -{}",searchBySms);
		 return searchBySms;
	 }
	 
	 @RequestMapping("/login/searchPw")
	 public void searchPw() {
		logger.info("/login/searchPw"); 
	 }
	 @ResponseBody
	 @PostMapping("/login/searchPw")
	 public boolean searchPwBySms(Users searchPw,HttpSession session) {
		 logger.info("/login/searchPw [POST]");
		 
		 //회원 가입 여부 조회하기
		 boolean getUser = loginService.checkUser(searchPw);
		 if(getUser) {
			 logger.info("회원 있음-인증번호 문자 보내기");
			 
			 String sendCodeForPw = loginService.sendMsg(searchPw);
			 
			 //세션에 회원 아이디, 이름 저장하기
			 session.setAttribute("userName", searchPw.getUserName());
			 session.setAttribute("userId", searchPw.getUserId());
			 session.setAttribute("userBirth", searchPw.getUserBirth());
			 //세션에 인증번호 저장하기
			 session.setAttribute("codeForPw", sendCodeForPw);
			 
			 return true;
		 }
		 
		 logger.info("회원 없음");
		 return false;
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/codeChkForPw")
	 public boolean chkCodeForPw(String pwSmsCode,HttpSession session ) {
		 logger.info("/lgoin/codeChkForPw");

		 boolean searchPwBySms = loginService.smsCodeForPw(pwSmsCode,session);
		 
		 logger.info("인증번호 검증 완료 {}",searchPwBySms);
		 return searchPwBySms;
	 }
	 
	 @RequestMapping("/login/makeNewPw")
	 public void makeNewPw() {
		 logger.info("/login/makeNewPw ");
	 }
	 
	 @ResponseBody
	 @PostMapping("/login/usedPwChk")
	 public boolean chkNewPw(Users updatePw,HttpSession session) {
		 logger.info("/login/usedPwchk [POST]");
		 
		boolean resultchkPw = loginService.chkUsedPw(updatePw,session);
		 
		logger.info("비밀번호 확인 {}",resultchkPw);
		 return resultchkPw;
	 }
	 
	 @PostMapping("/login/makeNewPw")
	 public String updatePw(Users userUpdatePw,HttpSession session) {
		 logger.info("login/updatePw [POST]");
		 
		boolean newPw = loginService.setNewPw(userUpdatePw,session);
		 
		
		 //비밀번호 업데이트 이후 세션초기화
		if(newPw) {
			session.invalidate();
		
			return "/login/login";
		}
		
		return "/login/makeNewPw";
		 
	 }
	 
	 

	 
	 @GetMapping("/login/naverLogin")
	 public String naverLogin(HttpSession session,@RequestParam(value="code") String code,@RequestParam(value="state") String state,Model model) {
		 
		 logger.info("/login/naverLogin");
		 
		 //access_token을 발급 요청
		String getToken ="";
			try {
				getToken =naverLoginService.getToken(session,code,state);
			} catch (Exception e) {
				e.printStackTrace();
			}
		logger.info("접근 토근 요청 : {}",getToken);
		
		
		//토큰으회원 정보 가져오기(프로필 정보 조회)
		Users userproFile = naverLoginService.getUserProfile(getToken);
		logger.info("회원 정보 저장 {}",userproFile);
		
		//회원 가입 여부 조회하기 (이름, 전화번호로)
		boolean isJoin = naverLoginService.getIsJoin(userproFile);

		
		
		if(!isJoin) {//회원 가입하기
			logger.info("회원가입");
			model.addAttribute("naverJoin", userproFile);
			return "/login/joinNaver";
			
			
		}else {//로그인하기
			int userNo = naverLoginService.naverLogin(userproFile);
			//회원 번호 세션 저장
			session.setAttribute("userNo", userNo);
			session.setAttribute("userId", userproFile.getUserId());
			logger.info("로그인 완료 ");
			
			
			return"/main";
		}
	 }
	 
	 @GetMapping("/login/joinNaver")
	 public void joinByNaver() {
		 logger.info("네이버 아이디로 회원가입");
		 
	 }
	 
	 @GetMapping("/login/kakaoLogin")
	 public String kakaoLogin(String acceses_token,@RequestParam(value="code") String code,HttpSession session,Model model) {
		//인가받은 코드로 토큰 받기
		logger.info("카카오 토큰 요청하기"); 
		String getKakaoToken = kakaoLoginService.getToken(code);
		logger.info("access_Token {}",getKakaoToken);

		//접근 토큰으로 회원 정보 가져오기 
		Users kakaoUserInfo = kakaoLoginService.getuserInfo(getKakaoToken);
		logger.info("회원 정보 {}", kakaoUserInfo);
		
		
		//회원정보 있는지 확인하기
		boolean isKakaoLogin = kakaoLoginService.isLogin(kakaoUserInfo);
		if(isKakaoLogin) {//로그인하기
				logger.info("카카오 로그인하기");
			//회원 번호 조회해오기
			int userNo = kakaoLoginService.getuserNo(kakaoUserInfo);
			
			//세션에 정보 담기(회원번호, 아이디)
			session.setAttribute("userNo", userNo);
			session.setAttribute("userId", kakaoUserInfo.getUserId());
			return "/main";
		}else { //회원 가입하기
			logger.info("카카오 회원가입하기");
			
			//모델값 넘겨주기
			model.addAttribute("kakaoInfo", kakaoUserInfo);
			return"/login/joinKakao";
		}
		
	 }
	 
	 
	 @GetMapping("/login/joinKakao")
	 public void joinKakao() {
		 logger.info("카카오 회원으로 가입하기");
	 }
}
