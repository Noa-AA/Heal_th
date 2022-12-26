package unhak.service.face;

import java.util.List;

import unhak.dto.CartDto;
import yerim.dto.Users;

public interface CartService {

	/* 장바구니 추가 */
	public void addCart(CartDto cart);
	/* 장바구니 정보 리스트 */
	public List<CartDto> getCartList(int userNo);	
	
	/* 카트 수량 수정 */
	public void modifyCount(int cartStock);		
	
	/* 카트 삭제 */
	public void deleteCart(CartDto cart);

	
	/**
	 * 유저 정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);
	
	
	
	
	public int checkByCt(CartDto cartNo);
	
	
	
	

	
}
