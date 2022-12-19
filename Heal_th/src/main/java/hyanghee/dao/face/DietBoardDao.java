package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.DietBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface DietBoardDao {

	public int selectCntAll();

	public List<DietBoard> selectList(BoardPaging boardPaging);

	public void insertDietBoard(DietBoard dietBoard);

	public Users selectUserInfo(int userno);

	public DietBoard selectBoard(DietBoard viewBoard);

	public void updateBoard(DietBoard dietBoard);

	public void delete(DietBoard dietNo);
	
	//공지사항
	public List<Notice> noticeList(BoardPaging boardPaging);

	public List<DietBoard> getList();
	
	public List<DietBoard> getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);
	
	public DietBoard getPage(int dietNo);
	
}
