package unhak.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hyanghee.dto.Beforeafter;
import unhak.dto.CartDto;
import unhak.service.face.CartService;

@Controller
public class CartController {
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired
	private CartService cartService;

	
	/* 장바구니 추가 */

	@GetMapping("/store/cart")
	
	public void addCartPOST(CartDto cart, HttpSession session , Model model) {
		// 로그인 체크
		
		logger.info("유저번호 확인{}", session.getAttribute("userNo"));
		cart.setUserNo((int)session.getAttribute("userNo"));
		
		
		
		logger.info("상품번호 확인{}",cart);
		
		cartService.addCart(cart);
		
		model.addAttribute("cartDto", cart);
		
		
		
		logger.info("상품번호 확인2{}",cart);
		
	}
	
	@ResponseBody
	@PostMapping("/store/checkCtNo")
	public int checkCtNo(CartDto cartNo) {
		
		logger.info("/store/checkCtNo[post]");
		
		logger.info("{}",cartNo);
		//중복확인
		int chkCtNo = cartService.checkByCt(cartNo);
		
		
		logger.info("체크확인{}",cartNo);
		
		return chkCtNo;
	}
	
	
	@GetMapping("/store/cartlist")
//	@RequestMapping(value="/store/cartlist" , method = RequestMethod.GET)
	public void cartlist(HttpSession session , Model model) {
		
		int userNo = (int)session.getAttribute("userNo"); //유저넘버불러오기
		
		logger.info("유저넘버 확인1 : {}",userNo);
		
		//유저의 장바구니 상품 정보들
		List<CartDto> list = cartService.getCartList(userNo);
		model.addAttribute("cartlist",list);
		
		logger.info("list : {}",list);
		
		logger.info("카트에 담은 유저 번호: {}",userNo);
		//---------------------------------------------------------------
		
		
	}
		
	/* 장바구니 수량 수정 */
	@RequestMapping(value="/cart/stockupdate",method=RequestMethod.POST)
	public String updateCartPOST(CartDto cart,Model model, int cartStock) {
		
		logger.info("/cart/update[POST]");
		cartService.modifyCount(cartStock);
		
		
		
		
		return "redirect:/store/cartlist";
		
	}		
	
	
	//장바구니 삭제
	@RequestMapping("/cart/cartDelete")
	public String delete(CartDto cartNo) {
		
		logger.info("{}", cartNo);
		
		cartService.deleteCart(cartNo);
		
		
		return "redirect:/store/cartlist";
	}
	
	
	
	
	//장바구니 전체 삭제
	@RequestMapping("/cart/cartDeleteAll")
	public String deleteAll(CartDto cart,HttpSession session) {
		
		logger.info("{}", cart);
		
		int userNo = (int)session.getAttribute("userNo"); //유저넘버불러오기
		
		cartService.deleteCartAll(userNo);
		
		
		return "redirect:/store/cartlist";
	}
	
	
	
	
//		/*장바구니 수량 수정 */
////		@PostMapping("/store/cartlist")
//		@RequestMapping(value="/store/cartlist" , int count, method = RequestMethod.POST)
//		public void updateCartPOST(CartDto cart,HttpSession session) {
//		
////		int cartStock = getCartStock
//			
//		logger.info("카트수량 확인1 : {} ", cartStock)
//		cartService.modifyCount(cart);
//
//		
//	}
	

	
	
	
//	/* 장바구니 페이지 이동 */	
//	@GetMapping("/store/cart/{userId}")
//	public String cartPageGET(@PathVariable("userId") String userId, Model model,HttpServletRequest request) {
//		model.addAttribute("cartInfo", cartService.getCartList(userId));
//		HttpSession session = request.getSession();
//		return "/store/cart";
//	}	
	

	
//	/* 장바구니 수량 수정 */
//	@PostMapping("/store/cart")
//	public String deleteCartPOST(CartDto cart,HttpServletRequest request) {
//		cartService.deleteCart(cart.getCartNo());
//		HttpSession session = request.getSession();
//		return "redirect:/store/cart/" + cart.getUserNo();
//	}	
}
