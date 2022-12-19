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
	
		//총 게시글 수 조회
		int totalCount = noticeDao.selectCntAll();
		
		//페이징 계산
		SaebyeolPaging paging = new SaebyeolPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Notice> list(SaebyeolPaging paging) {
		
		logger.debug("Listpaging {}", paging);
		
		return noticeDao.selectList(paging);
	}
	
	@Override
	public Notice view(Notice viewNotice) {
		
		//조회수 증가
		noticeDao.updateHit(viewNotice);
		
		//상세보기 조회 결과 리턴
		return noticeDao.selectNotice(viewNotice);
	}
	
	@Override
	
	public void write(Notice notice) {
		
		if("".equals(notice.getNoticeTtl())) {
			notice.setNoticeTtl("제목없음");
		}
		
		noticeDao.insertNotice(notice);
	}
	
	@Override
	public void update(Notice notice) {
		if("".equals(notice.getNoticeTtl())) {
			notice.setNoticeTtl("제목없음");
		}
		
		noticeDao.updateNotice(notice);
		
	}
	
	@Override
	public void delete(Notice notice) {
		
		noticeDao.delete(notice);
		
	}

}

