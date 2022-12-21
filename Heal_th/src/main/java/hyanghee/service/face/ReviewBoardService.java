package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.ReviewBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface ReviewBoardService {

	public BoardPaging getPaging(int curPage);

	public List<ReviewBoard> list(BoardPaging boardPaging);

	//유저 정보 찾기
	public Users getUserInfo(int userno);
	
	public void insertReview(ReviewBoard reviewBoard);

	public ReviewBoard view(ReviewBoard viewBoard);

	public void update(ReviewBoard reviewBoard);

	public void delete(ReviewBoard reviewNo);

	//공지사항
	public List<Notice> notice(BoardPaging boardPaging);
	
	public List<ReviewBoard> getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);

	public ReviewBoard getPage(int reviewNo);

	//포인트
	public int getPoint(int userno);

	public void updatePoint(int point);
	
	
	

}
