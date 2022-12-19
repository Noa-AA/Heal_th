package hyanghee.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.DietBoardDao;
import hyanghee.dto.DietBoard;
import hyanghee.service.face.DietBoardService;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

@Service
public class DietBoardServiceImpl implements DietBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired DietBoardDao dietBoardDao;

	@Override
	public BoardPaging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = dietBoardDao.selectCntAll();
						
		//페이징 계산
		BoardPaging boardPaging = new BoardPaging(totalCount, curPage);
				
		return boardPaging;
	}

	@Override
	public List<DietBoard> list(BoardPaging boardPaging) {
		return dietBoardDao.selectList(boardPaging);
	}

	@Override
	public void insertDietBoard(DietBoard dietBoard) {
		dietBoardDao.insertDietBoard(dietBoard);
	}

	
	@Override
	public Users getUserInfo(int userno) {
		return dietBoardDao.selectUserInfo(userno);
	}
	
	@Override
	public DietBoard view(DietBoard viewBoard) {
		return dietBoardDao.selectBoard(viewBoard);
	}

	@Override
	public void update(DietBoard dietBoard) {
		//게시글 처리
		if( "".equals( dietBoard.getdTitle() ) ) {
			dietBoard.setdTitle("(제목없음)");
		}
		
		dietBoardDao.updateBoard(dietBoard);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
//		if( file.getSize() <= 0 ) {
//			return;
//		}
		
		//파일이 저장될 경로
//		String storedPath = context.getRealPath("upload");
//		File storedFolder = new File( storedPath );
//		if( !storedFolder.exists() ) {
//			storedFolder.mkdir();
//		}
		
		//파일이 저장될 이름
//		String originName = file.getOriginalFilename();
//		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
//		File dest = new File( storedFolder, storedName );
//		
//		try {
//			file.transferTo(dest);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
//		BoardFile boardFile = new BoardFile();
//		boardFile.setBoardNo( board.getBoardNo() );
//		boardFile.setOriginName(originName);
//		boardFile.setStoredName(storedName);
//		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
//		boardDao.deleteFile(board);
//		
//		boardDao.insertFile(boardFile);
//
		
	}

	@Override
	public void delete(DietBoard dietNo) {
		dietBoardDao.delete(dietNo);
	}

	@Override
	public List<Notice> notice(BoardPaging boardPaging) {
		return dietBoardDao.noticeList(boardPaging);
	}

	@Override
	public List<DietBoard> getSearchPaging(BoardSearch boardSearch) {
		return dietBoardDao.getSearchPaging(boardSearch);
	}

	@Override
	public int getTotal(BoardSearch boardSearch) {
		return dietBoardDao.getTotal(boardSearch);
	}
	
}
