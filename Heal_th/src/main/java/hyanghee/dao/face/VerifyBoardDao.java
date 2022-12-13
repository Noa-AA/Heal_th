package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.VerifyBoard;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

public interface VerifyBoardDao {

	public int selectCntAll();

	public List<VerifyBoard> selectList(BoardPaging boardPaging);

	public Users selectUserInfo(int userno);

	public void insertVerifyBoard(VerifyBoard verifyBoard);

	public VerifyBoard selectBoard(VerifyBoard viewBoard);

	public void updateBoard(VerifyBoard verifyBoard);

	public void delete(VerifyBoard verifyNo);

	
	

}
