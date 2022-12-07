package hyanghee.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
		
		return bfBoardDao.selectUserInfo(userno);
	}

	//게시글 삭제
	@Override
	public void delete(Beforeafter bfNo) {
		
		bfBoardDao.delete(bfNo);
		
	}


	@Override
	public Beforeafter view(Beforeafter viewBoard) {
		return bfBoardDao.selectBoard(viewBoard);
	}


	@Override
	public void update(Beforeafter beforeafter) {
		//게시글 처리
				if( "".equals( beforeafter.getBfTitle() ) ) {
					beforeafter.setBfTitle("(제목없음)");
				}
				
				bfBoardDao.updateBoard(beforeafter);
				
				//--------------------------------------------
				
				//첨부파일 처리
				
				//빈 파일일 경우
//				if( file.getSize() <= 0 ) {
//					return;
//				}
				
				//파일이 저장될 경로
//				String storedPath = context.getRealPath("upload");
//				File storedFolder = new File( storedPath );
//				if( !storedFolder.exists() ) {
//					storedFolder.mkdir();
//				}
				
				//파일이 저장될 이름
//				String originName = file.getOriginalFilename();
//				String storedName = originName + UUID.randomUUID().toString().split("-")[4];
				
				//저장할 파일의 정보 객체
//				File dest = new File( storedFolder, storedName );
//				
//				try {
//					file.transferTo(dest);
//				} catch (IllegalStateException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
				
				//--------------------------------------------
				
				//첨부파일 정보 DB 기록
//				BoardFile boardFile = new BoardFile();
//				boardFile.setBoardNo( board.getBoardNo() );
//				boardFile.setOriginName(originName);
//				boardFile.setStoredName(storedName);
//				
				//기존에 게시글에 연결된 첨부파일을 삭제한다
//				boardDao.deleteFile(board);
//				
//				boardDao.insertFile(boardFile);
//		
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