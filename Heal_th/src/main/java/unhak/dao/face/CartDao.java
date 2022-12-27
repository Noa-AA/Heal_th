package unhak.dao.face;

import java.util.List;

import unhak.dto.CartDto;
import yerim.dto.Users;

public interface CartDao {

	/* 카트 추가 */
	public void insertcart(CartDto cart);
	
	/* 카트 삭제 */
	public int deleteCart(CartDto cart);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDto cart);
	
	/* 카트 목록 */
	public List<CartDto> getCart(int userNo);	
	
	/* 카트 확인 */
	public CartDto checkCart(CartDto cart);		
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartDto dto);

	/**
	 * 유저번호에 따른 유저정보 데이터조회
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);

	
	
	/**
	 * 중복 조회 카트번호 체크
	 * @param cartNo - 체크할 카트번호
	 * @return
	 */
	public int selectBychkCtNo(CartDto cartNo);

}
