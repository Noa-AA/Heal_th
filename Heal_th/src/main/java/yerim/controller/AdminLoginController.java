package yerim.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import yerim.dto.Admin;
import yerim.service.face.AdminLoginService;

@Controller
public class AdminLoginController {
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired AdminLoginService adminLoginService;
	 
	 @RequestMapping("/admin/adminLogin")
	 public void adminLogin() {
		 logger.info("/admin/adminLogin [GET]");
		 
	 }

	 @PostMapping("/admin/adminLogin")
	 public String loginProc(Admin admin, HttpSession session , Model model) {
		logger.info("/admin/adminLogin [POST]");
		 
		//아이디 확인하기
		
		boolean isAdminLogin = adminLoginService.isLogin(admin);
		
		if(isAdminLogin) { //로그인하기
			//관리자 번호 조회하기
			int adminNo = adminLoginService.getadminNo(admin);
			session.setAttribute("adminNo", adminNo);
			
			logger.info("로그인 성공");
			return "/admin/userList";
		}else {
			//모델값으로 false 전달하기
			logger.info("로그인 실패");
			model.addAttribute("isAdminLogin", isAdminLogin);
			return "/admin/adminLogin";
		}
		
		 
		 
		 
	 }
}
