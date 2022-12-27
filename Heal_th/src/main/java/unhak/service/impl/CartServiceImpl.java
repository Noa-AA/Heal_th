package unhak.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unhak.dao.face.CartDao;
import unhak.dto.CartDto;
import unhak.service.face.CartService;
import yerim.dto.Users;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;
	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	public Users getUserInfo(int userno) {
		return cartDao.selectUserInfo(userno);
	}
	
	
	@Override
	public void addCart(CartDto cart) {

		cartDao.insertcart(cart);
		
	}

	@Override
	public List<CartDto> getCartList(int userNo) {
		
		List<CartDto> cart = cartDao.getCart(userNo);
		
		
		
		return cart;
		
	}
	
	
	//장바구니 삭제
	@Override
	public void deleteCart(CartDto cart) {

		cartDao.deleteCart(cart);
	}

	//장바구니 수량수정
	@Override
	public void modifyCount(int cartStock) {
	}


	@Override
	public int checkByCt(CartDto cartNo) {

		int chkCtNo = cartDao.selectBychkCtNo(cartNo);
		logger.info("카트번호 중복 체크{}",chkCtNo);
		return chkCtNo;
	}	
}
