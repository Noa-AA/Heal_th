package saebyeol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import saebyeol.dao.face.NoticeDao;
import saebyeol.dto.Notice;
import saebyeol.service.face.NoticeService;
import saebyeol.utill.SaebyeolPaging;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired NoticeDao noticeDao;
	
	@Override
	public SaebyeolPaging getPaging(int curPage) {
		
		int totalCount = noticeDao.selectCntAll();
		
		SaebyeolPaging paging = new SaebyeolPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Notice> list(SaebyeolPaging paging) {
		
		logger.info("paging {}", paging);
		
		return noticeDao.selectList(paging);
	}
	
	

}
