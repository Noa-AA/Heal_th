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
import daeyeon.util.AdminPaymentPaging;
import daeyeon.util.AdminUserPaging;
import unhak.dto.PaymentDto;
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
		
		AdminUserPaging adminUserPaging = new AdminUserPaging();
		adminUserPaging = adminUserService.getUserPaging(curPage);
		logger.info("adminPaging : {} ", adminUserPaging);
		
		List<Users> userlist = adminUserService.getUserList(adminUserPaging);	
		
		logger.info("Admin user View : {} ", userlist);
		
		model.addAttribute("userList", userlist);
		model.addAttribute("paging", adminUserPaging);
	}
	
	
	//검색하기
	@PostMapping("/user")
	public void searchUser(Model model, Users users, AdminUserPaging adminUserPaging, String curPage) {
		logger.info("/admin/user [POST]");
		logger.info("adminUserPaging : {}", adminUserPaging);
		
		AdminUserPaging searchTK = adminUserPaging;
		
		adminUserPaging = adminUserService.getSearchPaging(adminUserPaging, curPage);
		
		adminUserPaging.setType(searchTK.getType());
		adminUserPaging.setKeyword(searchTK.getKeyword());
		
		logger.info("adminPaging : {} ", searchTK);
		//검색된 회원 조회
		List<Users> searchList = adminUserService.userSearchlist(adminUserPaging);
		
		logger.info("searchList : {} ", searchList);
		
		model.addAttribute("userList", searchList);
		model.addAttribute("paging", adminUserPaging);
		
	}
	
	
	
	//전체 주문목록
	@GetMapping("/payment")
	public void paymentList(Model model, String curPage) {
		logger.info("/admin/payment [GET]");
			
		AdminPaymentPaging adminPaymentPaging = new AdminPaymentPaging();
		adminPaymentPaging = adminUserService.getPaymentPaging(curPage);
		logger.info("adminPaging : {} ", adminPaymentPaging);
			
		List<PaymentDto> paymentlist = adminUserService.getPaymentList(adminPaymentPaging);	
//			
//		logger.info("Admin payment View : {} ", paymentlist);
//			
		model.addAttribute("paymentList", paymentlist);
		model.addAttribute("paging", adminPaymentPaging);
	}
	
	//검색하기
	@PostMapping("/payment")
	public void searchPaymentList(Model model, Users users, AdminPaymentPaging adminPaymentPaging, String curPage) {
		logger.info("/admin/user [POST]");
		logger.info("adminPaymentPaging : {}", adminPaymentPaging);
			
		AdminPaymentPaging searchTK = adminPaymentPaging;
			
		adminPaymentPaging = adminUserService.getPaymentSearchPaging(adminPaymentPaging, curPage);
			
		adminPaymentPaging.setType(searchTK.getType());
		adminPaymentPaging.setKeyword(searchTK.getKeyword());
			
		logger.info("adminPaymentPaging : {} ", searchTK);
//		검색된 회원 조회
		List<PaymentDto> searchPaymentList = adminUserService.paymentSearchlist(adminPaymentPaging);
			
		logger.info("Admin searchPaymentList View : {} ", searchPaymentList);
//			
		model.addAttribute("paymentList", searchPaymentList);
		model.addAttribute("paging", adminPaymentPaging);
			
		}
	
		
}



