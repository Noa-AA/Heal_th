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

@Controller
public class PaymentController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private PaymentService paymentService;


//@PostMapping("/store/payment" , method = RequestMethod.POST)
//public String order(HttpSession session, )
	
	
	@RequestMapping(value="/store/payment", method=RequestMethod.GET)
	public String order(PaymentDto viewPayment, Model model, HttpSession session) {
		
		
		logger.info("Payment");
		int userNo = (int) session.getAttribute("uesrNo"); //유저넘버 불러오기
		
		
		
		return "redirect:/store/list"; //나중에 주문목록리스트(/store/orderlist)로 변경예정
	}
}
