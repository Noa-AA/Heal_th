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

	public Users selectUserInfo(int userno);

	public ReviewBoard selectBoard(ReviewBoard viewBoard);

	public void updateBoard(ReviewBoard reviewBoard);

	public void delete(ReviewBoard reviewNo);

	public List<Notice> noticeList(BoardPaging boardPaging);

	public List<ReviewBoard> getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);

	public ReviewBoard getPage(int reviewNo);
	
}
