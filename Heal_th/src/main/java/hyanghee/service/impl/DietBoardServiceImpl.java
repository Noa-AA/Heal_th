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
import jucheol.dao.face.CommentDao;
import jucheol.dao.face.FileuploadDao;
import jucheol.dto.Comment;
import jucheol.dto.Fileupload;
import saebyeol.dto.Notice;
import yerim.dto.Users;

@Service
public class DietBoardServiceImpl implements DietBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//게시글
	@Autowired DietBoardDao dietBoardDao;
	
	//첨부 파일
	@Autowired FileuploadDao fileuploadDao;
	
	//댓글
	@Autowired CommentDao commentDao;
	
	

	//게시글 등록
	@Override
	public void insertDietBoard(DietBoard dietBoard) {
		dietBoardDao.insertDietBoard(dietBoard);
	}

	//유저 정보 찾기
	@Override
	public Users getUserInfo(int userno) {
		return dietBoardDao.selectUserInfo(userno);
	}
	
	//게시글 상세보기
	@Override
	public DietBoard view(DietBoard viewBoard) {
		
		dietBoardDao.updateHit(viewBoard);
		
		return dietBoardDao.selectBoard(viewBoard);
	}

	//게시글 수정
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

	//게시글 삭제
	@Override
	public void delete(DietBoard dietNo) {
		
		//첨부파일
		Fileupload fileUpload = new Fileupload();
		fileUpload.setBoardNo(dietNo.getDietNo());
		fileUpload.setCategoryNo(3);
				
		//댓글
		Comment comment = new Comment();
				
		comment.setBoardNo(0);		
		comment.setCategoryNo(0); 
		commentDao.deleteComment(comment);	
		
		fileuploadDao.deleteFile(fileUpload);
		
		dietBoardDao.delete(dietNo);
	}

	//공지사항
	@Override
	public List<Notice> notice(BoardSearch boardSearch) {
		return dietBoardDao.notice(boardSearch);
	}

	//게시글 검색 / 목록
	@Override
	public List<DietBoard> getSearchPaging(BoardSearch boardSearch) {
		return dietBoardDao.getSearchPaging(boardSearch);
	}

	//전체 게시글
	@Override
	public int getTotal(BoardSearch boardSearch) {
		return dietBoardDao.getTotal(boardSearch);
	}

	//포인트 정보
	@Override
	public int getPoint(int userno) {
		return dietBoardDao.getPoint(userno);
	}
	
	//포인트 주기
	@Override
	public void updatePoint(int point) {
		Users users = new Users();
		
		users.setUserNo(point);
		dietBoardDao.updatePoint(users);
	}
	
}
