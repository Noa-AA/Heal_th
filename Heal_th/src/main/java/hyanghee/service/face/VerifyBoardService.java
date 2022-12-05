package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.VerifyBoard;
import hyanghee.util.BoardPaging;

public interface VerifyBoardService {

	public BoardPaging getPaging(int curPage);

	public List<VerifyBoard> list(BoardPaging boardPaging);

	

}