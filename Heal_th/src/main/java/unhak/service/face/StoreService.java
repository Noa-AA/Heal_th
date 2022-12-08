package unhak.service.face;

import java.util.List;

import org.springframework.stereotype.Service;

import unhak.dto.StoreDto;
import unhak.util.StorePaging;


public interface StoreService {

	
	public List<StoreDto> list(StorePaging paging);


	
	/**
	 * 상품 상세보기
	 * @param viewStore - 상세 조회할 상품아이디 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public StoreDto storeview(StoreDto viewStore);



	public StorePaging getPaging(int curPage);






}
