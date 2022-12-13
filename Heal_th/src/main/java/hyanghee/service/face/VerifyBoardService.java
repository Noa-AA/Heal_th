package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.VerifyBoard;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

public interface VerifyBoardService {

	public BoardPaging getPaging(int curPage);

	public List<VerifyBoard> list(BoardPaging boardPaging);

	public void insertVerifyBoard(VerifyBoard verifyBoard);

	public VerifyBoard view(VerifyBoard viewBoard);

	public void update(VerifyBoard verifyBoard);

	public void delete(VerifyBoard verifyNo);

	public Users getUserInfo(int userno);

	

}
