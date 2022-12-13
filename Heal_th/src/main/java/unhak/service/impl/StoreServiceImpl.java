package unhak.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unhak.dao.face.StoreDao;
import unhak.dto.CartDto;
import unhak.dto.StoreDto;
import unhak.service.face.StoreService;
import unhak.util.StorePaging;

@Service
public class StoreServiceImpl implements StoreService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
@Autowired StoreDao storeDao;



@Override
public StorePaging getPaging(int curPage) {
	
	int totalcount = storeDao.selectcntAll();
	
	//페이징 계산
	StorePaging paging = new StorePaging(totalcount,curPage);
	
	
	return paging;
}
	
	@Override
	public List<StoreDto> list(StorePaging paging) {
		return storeDao.selectList(paging);
	}




	@Override
	public StoreDto storeview(StoreDto viewStore) {
		
		//조회수 증가
		storeDao.updateHit(viewStore);
		
		//상세보기 조회 결과 리턴
		return storeDao.selectStore(viewStore);
	}

	
	//카트담기
//	@Override
//	public void addCart(CartDto cart) {
//		storeDao.addCart(cart);
//		
//	}
	
	
	
	
}
