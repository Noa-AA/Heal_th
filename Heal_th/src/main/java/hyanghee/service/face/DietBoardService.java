package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.DietBoard;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

public interface DietBoardService {

	public BoardPaging getPaging(int curPage);

	public List<DietBoard> list(BoardPaging boardPaging);

	public void insertDietBoard(DietBoard dietBoard);

	public DietBoard view(DietBoard viewBoard);

	public void update(DietBoard dietBoard);

	public void delete(DietBoard dietNo);

	public Users getUserInfo(int userno);

}
