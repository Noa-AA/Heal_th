package unhak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import unhak.dto.CartDto;
import unhak.service.face.CartService;
import yerim.dto.Users;

@Controller
public class CartController {

	
	@Autowired
	private CartService cartService;

	
	/* 장바구니 추가 */
	/**
	 * 0: 등록 실패
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재
	 * 5: 로그인 필요
	 * 
	 */
	@PostMapping("/store/cart/add")
	@ResponseBody
	public String addCartPOST(CartDto cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		Users use = (Users)session.getAttribute("user");
		if(use == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartService.addCart(cart);
		
		return result + "";
	}	
	
	/* 장바구니 페이지 이동 */	
	@GetMapping("/store/cart/{userId}")
	public String cartPageGET(@PathVariable("userId") String userId, Model model) {
		
		model.addAttribute("cartInfo", cartService.getCartList(userId));
		
		return "/store/cart";
	}	
	
	/* 장바구니 수량 수정 */
	@PostMapping("/store/cart/update")
	public String updateCartPOST(CartDto cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/store/cart/" + cart.getUserNo();
		
	}	
	
	/* 장바구니 수량 수정 */
	@PostMapping("/store/cart/delete")
	public String deleteCartPOST(CartDto cart) {
		
		cartService.deleteCart(cart.getCartNo());
		
		return "redirect:/store/cart/" + cart.getUserNo();
		
	}	
}
