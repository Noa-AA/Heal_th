package hyanghee.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.BfBoardDao;
import hyanghee.dto.Beforeafter;
import hyanghee.service.face.BfBoardService;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

@Service
public class BfBoardServiceImpl implements BfBoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BfBoardDao bfBoardDao;

	@Override
	public BoardPaging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = bfBoardDao.selectCntAll();
				
		//페이징 계산
		BoardPaging paging = new BoardPaging(totalCount, curPage);
				
		return paging;
	}


	//비포 애프터 게시글 생성
	@Override
	public void insertBfBoard(Beforeafter bfBoard) {
		
		bfBoardDao.insertBfBoard(bfBoard);
		
	}

	//게시글
	@Override
	public List<Beforeafter> list(BoardPaging boardPaging) {

		return bfBoardDao.selectList(boardPaging);
	}




	//유저 정보 찾기
	@Override
	public Users getUserInfo(int userno) {
		
		return bfBoardDao.getUserInfo(userno);
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