package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.VerifyBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface VerifyBoardDao {

	public int selectCntAll();

	//목록
	public List<VerifyBoard> selectList(BoardPaging boardPaging);

	//유저 정보
	public Users selectUserInfo(int userno);

	//게시글 작성
	public void insertVerifyBoard(VerifyBoard verifyBoard);

	public VerifyBoard selectBoard(VerifyBoard viewBoard);

	//게시글 수정
	public void updateBoard(VerifyBoard verifyBoard);

	//게시글 삭제
	public void delete(VerifyBoard verifyNo);

	//조회수
	public void updateHit(VerifyBoard viewBoard);

	//포인트
	public int getPoint(int userno);

	//포인트 적립
	public void updatePoint(Users users);

	//공지사항
	public List<Notice> noticeList(BoardPaging paging);

	public int getTotal(BoardSearch boardSearch);

	public List<VerifyBoard> getSearchPaging(BoardSearch boardSearch);

	public VerifyBoard getPage(int verifyNo);

	
	

}
