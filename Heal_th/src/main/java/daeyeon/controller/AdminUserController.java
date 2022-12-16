package daeyeon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import daeyeon.service.face.AdminUserService;
import daeyeon.util.AdminPaging;
import daeyeon.util.UserPageMaker;
import daeyeon.util.UserSearch;
import hyanghee.util.BoardPageMaker;
import yerim.dto.Users;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminUserService adminUserService;
	
	
	//회원목록
	@GetMapping("/user")
	public void userList(Model model, String curPage ) {
		logger.info("/admin/user [GET]");
		
		AdminPaging adminPaging = new AdminPaging();
		adminPaging = adminUserService.getUserPaging(curPage);
		logger.info("adminPaging : {} ", adminPaging);
		
		List<Users> userlist = adminUserService.getUserList(adminPaging);	
		
		logger.info("Admin user View : {} ", userlist);
		
		model.addAttribute("userList", userlist);
		model.addAttribute("paging", adminPaging);
	}
	
	
	//검색하기
	@PostMapping("/user")
	public void searchUser(Model model, UserSearch userSearch, Users users, AdminPaging adminPaging, String curPage) {
		logger.info("/admin/user [POST]");
		logger.info("adminPaging : {}", adminPaging.getCurPage());
		
		adminPaging = adminUserService.getSearchPaging(adminPaging, curPage);
//		logger.info("adminPaging : {} ", adminPaging);
		
	}
	
		
}



