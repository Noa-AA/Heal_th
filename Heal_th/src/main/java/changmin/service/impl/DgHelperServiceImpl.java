package changmin.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.dao.face.DgHelperDao;
import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.service.face.DgHelperService;
import changmin.util.Paging;

@Service
public class DgHelperServiceImpl implements DgHelperService {

	private Logger logger = LoggerFactory.getLogger(DgHelperServiceImpl.class);

	@Autowired private DgHelperDao dgHelperDao;
	
	@Override
	public void addRecord(String recordcon, int userno) {
		dgHelperDao.insertRecord(recordcon);
	}

	@Override
	public Paging getPaging(String curPage, int userno) {
		//총 게시글 수 조회하기
		int totalCount = dgHelperDao.selectCntAll();
		
		
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, curPage2);
		
		return paging;
	}

	@Override
	public List<HealthRecord> getRecordList(Paging paging, int userno) {
		
		return dgHelperDao.selectRecord(paging);
	}

	@Override
	public BodyInfo getBodyInfo(int userno) {

		return dgHelperDao.selectBodyInfo(userno);
	}

}
