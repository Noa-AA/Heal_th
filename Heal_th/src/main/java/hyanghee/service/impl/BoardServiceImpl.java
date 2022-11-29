package hyanghee.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.BoardDao;
import hyanghee.dto.Board;
import hyanghee.service.face.BoardService;
import hyanghee.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BoardDao boardDao;

	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = boardDao.selectCntAll();
				
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
				
		return paging;
	}

	//비포 애프터 게시글 생성
	@Override
	public void insertBfBoard(Board board) {
		boardDao.insertBfBoard(board);
		
	}

//	//비포 애프터 게시글 삭제
//	@Override
//	public Map<String, Object> deleteBfArticle(int userid) {
//		
//		boardDao.deleteBfArticle(id);
//		
//		Map<String, Object> rs = new HashMap<>();
//		
//		rs.put("resultCode", "S-1");
//		rs.put("msg", id + "게시글 삭제 성공");
//		
//		return rs;
//		
//	}



//	@Override
//	public List<Board> list(Paging paging) {
//
//		return boardDao.selectList(paging);
//	}
	
	
	

}