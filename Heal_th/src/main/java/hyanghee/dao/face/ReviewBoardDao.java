package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.Beforeafter;
import hyanghee.dto.ReviewBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface ReviewBoardDao {

	//게시글 작성
	public void insertBoard(ReviewBoard reviewBoard);

	public List<ReviewBoard> selectList(BoardPaging boardPaging);

	public int selectCntAll();

	//유저 정보 찾기
	public Users selectUserInfo(int userno);

	//게시글 보기
	public ReviewBoard selectBoard(ReviewBoard viewBoard);

	//게시글 수정
	public void updateBoard(ReviewBoard reviewBoard);

	//게시글 삭제
	public void delete(ReviewBoard reviewNo);

	//공지사항 목록
	public List<Notice> noticeList(BoardPaging boardPaging);

	//검색기능
	public List<ReviewBoard> getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);

	public ReviewBoard getPage(int reviewNo);

	//조회수
	public void updateHit(ReviewBoard viewBoard);

	//포인트 찾기
	public int getPoint(int userno);

	//포인트 증가 - 게시글 작성 후
	public void updatePoint(Users users);

	
}
