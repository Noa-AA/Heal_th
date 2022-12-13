package unhak.service.face;

import java.util.List;

import unhak.dto.CartDto;

public interface CartService {

	/* 장바구니 추가 */
	public int addCart(CartDto cart);	
	
	/* 장바구니 정보 리스트 */
	public List<CartDto> getCartList(String memberId);	
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDto cart);		
	
	/* 카트 삭제 */
	public int deleteCart(int cartId);
}
