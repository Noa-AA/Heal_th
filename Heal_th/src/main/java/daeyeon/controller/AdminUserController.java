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

import daeyeon.service.face.AdminUserService;
import daeyeon.util.AdminPaging;
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
	public void searchUser(Model model, Users users, AdminPaging adminPaging, String curPage) {
		logger.info("/admin/user [POST]");
		logger.info("adminPaging : {}", adminPaging);
		
		AdminPaging searchTK = adminPaging;
		
		adminPaging = adminUserService.getSearchPaging(adminPaging, curPage);
		
		adminPaging.setType(searchTK.getType());
		adminPaging.setKeyword(searchTK.getKeyword());
		
		logger.info("adminPaging : {} ", searchTK);
		//검색된 회원 조회
		List<Users> searchList = adminUserService.userSearchlist(adminPaging);
		
		logger.info("searchList : {} ", searchList);
		
		model.addAttribute("userList", searchList);
		model.addAttribute("paging", adminPaging);
		
	}
	
		
}



