package unhak.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import unhak.dto.PaymentDto;
import unhak.service.face.PaymentService;
import yerim.dto.Users;

@Controller
public class PaymentController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentService paymentService;


//@PostMapping("/store/payment" , method = RequestMethod.POST)
//public String order(HttpSession session, )
	
	
	@RequestMapping(value="/store/payment", method=RequestMethod.GET)
	public void order(PaymentDto viewPayment, Model model, HttpSession session) {
		
		
		logger.info("Payment[GET]");
		int userNo = (int) session.getAttribute("userNo"); //유저넘버 불러오기
		
		//회원정보 조회하고 데이터가져오기 이름,주소,상품명 등등
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			Users user = paymentService.getUserInfo(userno);
			logger.info("userInfo : {}", user);
			model.addAttribute("user", user);
			
			
//		int userId = userNo.getUserNo();
//		return "redirect:/store/list"; //나중에 주문목록리스트(/store/orderlist)로 변경예정
		
		}
		
		//유저정보 조회
		
	}
	
	
	//payment POST
	@RequestMapping(value="/store/payment",method=RequestMethod.POST)
	public void orderlist(PaymentDto listPayment,Model model, HttpSession session) {
		logger.info("payment[POST]");
	
		
	}
}
