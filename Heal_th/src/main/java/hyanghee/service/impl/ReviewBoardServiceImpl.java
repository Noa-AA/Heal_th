package hyanghee.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.ReviewBoardDao;
import hyanghee.dto.ReviewBoard;
import hyanghee.service.face.ReviewBoardService;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReviewBoardDao reviewBoardDao;

	@Override
	public BoardPaging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = reviewBoardDao.selectCntAll();
						
		//페이징 계산
		BoardPaging boardPaging = new BoardPaging(totalCount, curPage);
		
		return boardPaging;
	}

	//게시글 목록
	@Override
	public List<ReviewBoard> list(BoardPaging boardPaging) {
		
		return reviewBoardDao.selectList(boardPaging);
		
	}
	
	//유저 정보
	@Override
	public Users getUserInfo(int userno) {
		return reviewBoardDao.selectUserInfo(userno);
	}

	//게시글 작성
	@Override
	public void insertReview(ReviewBoard reviewBoard) {
		
		reviewBoardDao.insertBoard(reviewBoard);
		
	}

	//게시글 상세보기
	@Override
	public ReviewBoard view(ReviewBoard viewBoard) {
		return reviewBoardDao.selectBoard(viewBoard);
	}

	@Override
	public void update(ReviewBoard reviewBoard) {
		//게시글 처리
		if( "".equals( reviewBoard.getrTitle() ) ) {
			reviewBoard.setrTitle("(제목없음)");
		}
		
		reviewBoardDao.updateBoard(reviewBoard);
		
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
		
	}

	@Override
	public void delete(ReviewBoard reviewNo) {
		reviewBoardDao.delete(reviewNo);
		
	}

	


	
	
}
