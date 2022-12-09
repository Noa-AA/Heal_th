package changmin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.dao.face.DgHelperDao;
import changmin.dto.BodyInfo;
import changmin.dto.DgmaJoin;
import changmin.dto.Dgmagotchi;
import changmin.dto.HealthRecord;
import changmin.service.face.DgHelperService;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

@Service
public class DgHelperServiceImpl implements DgHelperService {

	private Logger logger = LoggerFactory.getLogger(DgHelperServiceImpl.class);

	@Autowired private DgHelperDao dgHelperDao;
	
	@Override
	public int addRecord(HealthRecord healthRecord) {
		
		return dgHelperDao.insertRecord(healthRecord); 
	}

	@Override
	public DgHelperPaging getDgHelperPaging(String curPage, int userno) {
		//총 게시글 수 조회하기
		int totalCount = dgHelperDao.selectCntAll();
		
		
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}
		
		//DgHelperPaging객체 생성
		DgHelperPaging dgHelperPaging = new DgHelperPaging(totalCount, curPage2);
		
		return dgHelperPaging;
	}

	@Override
	public List<HealthRecord> getRecordList(DgHelperPaging DgHelperPaging, int userno) {
		
		List<HealthRecord> list =dgHelperDao.selectRecord(DgHelperPaging); 
		
		return list;
	}

	@Override
	public BodyInfo getBodyInfo(int userno) {

		return dgHelperDao.selectBodyInfo(userno);
	}

	@Override
	public Users getUserInfo(int userno) {

		return dgHelperDao.selectUserInfo(userno);
	}

	@Override
	public void removeRecord(int recordNo) {

		dgHelperDao.deleteRecord(recordNo);
	}

	@Override
	public void changeRecord(int recordNo) {
	
	}

	@Override
	public Dgmagotchi getDgmaInfo(int userno) {

		return dgHelperDao.selectDgmaInfo(userno);
	}

	@Override
	public int getDgmaCnt(int userno) {
		
		return dgHelperDao.selectCntDgmaInfo(userno);
	}
	
	@Override
	public void addDgmaInfo(int userno) {

		dgHelperDao.insertDgmaInfo(userno);
		
	}

	@Override
	public void saveDgmaInfo(Dgmagotchi dgmagotchi) {
		
		dgHelperDao.updateDgmaInfo(dgmagotchi);
		
	}

	@Override
	public List<DgmaJoin> getDgmaRanking() {

		List<DgmaJoin> list = dgHelperDao.selectDgmaRanking();
		
		return list;
	}




}
