package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.DietBoard;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

public interface DietBoardDao {

	public int selectCntAll();

	public List<DietBoard> selectList(BoardPaging boardPaging);

	public void insertDietBoard(DietBoard dietBoard);

	public Users selectUserInfo(int userno);

	public DietBoard selectBoard(DietBoard viewBoard);

	public void updateBoard(DietBoard dietBoard);

	public void delete(DietBoard dietNo);

}
