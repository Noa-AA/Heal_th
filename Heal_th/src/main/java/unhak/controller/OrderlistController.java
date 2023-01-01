package unhak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import unhak.dto.PaymentDto;
import unhak.service.face.OrderlistService;

@Controller
public class OrderlistController {

	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OrderlistService orderlistService;
	
	/* 구매 목록 페이지*/
	@GetMapping("/store/orderlist")
	public void orderlist(HttpSession session , Model model) {
		int userNo = (int)session.getAttribute("userNo"); //유저넘버불러오기
		logger.info("유저넘버 확인1 : {}",userNo);
		
		//유저의 구매 상품 정보
		List<PaymentDto> list = orderlistService.getOrderList(userNo);
		model.addAttribute("orderlist",list);
		
		logger.info("list : {}",list);
	}
	
}
