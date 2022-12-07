package unhak.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unhak.dao.face.StoreDao;
import unhak.dto.StoreDto;
import unhak.service.face.StoreService;
import unhak.util.StorePaging;

@Service
public class StoreServiceImpl implements StoreService {

@Autowired StoreDao storeDao;



	
	@Override
	public List<StoreDto> list(StorePaging paging) {
		return storeDao.selectList(paging);
	}




	@Override
	public StoreDto storeview(StoreDto viewStore) {
		
		//조회수 증가
		storeDao.updateHit(viewStore);
		
		//상세보기 조회 결과 리턴
		return storeDao.selectBoard(viewStore);
	}
}
