package unhak.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unhak.dao.face.CartDao;
import unhak.dto.CartDto;
import unhak.service.face.CartService;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;
	
//	@Autowired
//	private  AttachMapper attachMapper;	

	@Override
	public int addCart(CartDto cart) {

		// 장바구니 데이터 체크
		CartDto checkCart = cartDao.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartDao.addCart(cart);
		} catch (Exception e) {
			return 0;
		}		
		
	}

	@Override
	public List<CartDto> getCartList(String memberId) {
		
		List<CartDto> cart = cartDao.getCart(memberId);
		
		for(CartDto dto : cart) {
			
//			/* 종합 정보 초기화 */
//			dto.initSaleTotal();
//			
//			/* 이미지 정보 얻기 */
////			int bookId = dto.getBookId();
////			
//////			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);
////			
////			dto.setImageList(imageList);
		}
		
		return cart;
		
	}
	
	@Override
	public int modifyCount(CartDto cart) {
		
		return cartDao.modifyCount(cart);
	}	
	
	@Override
	public int deleteCart(int cartId) {

		return cartDao.deleteCart(cartId);
	}	
}
