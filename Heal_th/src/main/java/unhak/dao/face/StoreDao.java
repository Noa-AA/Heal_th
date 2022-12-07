package unhak.dao.face;

import java.util.List;

import unhak.dto.StoreDto;
import unhak.util.StorePaging;

public interface StoreDao  {

	public List<StoreDto> selectList(StorePaging paging);

	
	/**
	 * 조회하려는 상품의 조회수를 1 증가시킨다
	 * @param viewStore - 조회된 상품 번호
	 */
	public void updateHit(StoreDto viewStore);

	
	/**
	 * 상품 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewStore - 조회하려는 상품 번호
	 * @return 조회된 상품 번호
	 */
	public StoreDto selectBoard(StoreDto viewStore);

}
