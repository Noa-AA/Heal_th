package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.ReviewBoard;
import hyanghee.util.BoardPaging;
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


	
	
	
	

}
