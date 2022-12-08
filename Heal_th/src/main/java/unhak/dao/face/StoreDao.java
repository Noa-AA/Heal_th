package unhak.dao.face;

import java.util.List;

import unhak.dto.StoreDto;
import unhak.util.StorePaging;

public interface StoreDao  {
	
	
	
	/**
	 * 전체 게시글 수를 조회한다
	 * @return 총 게시글 수
	 */
	public int selectcntAll();

	
	
	/**페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
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
	public StoreDto selectStore(StoreDto viewStore);

}
