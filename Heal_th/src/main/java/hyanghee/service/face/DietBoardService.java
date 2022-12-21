package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.DietBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface DietBoardService {

	public BoardPaging getPaging(int curPage);

	public List<DietBoard> list(BoardPaging boardPaging);

	public void insertDietBoard(DietBoard dietBoard);

	public DietBoard view(DietBoard viewBoard);

	public void update(DietBoard dietBoard);

	public void delete(DietBoard dietNo);

	public Users getUserInfo(int userno);

	//공지사항
	public List<Notice> notice(BoardPaging boardPaging);

	public Object getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);

	//포인트
	public int getPoint(int userno);

	public void updatePoint(int point);

}
