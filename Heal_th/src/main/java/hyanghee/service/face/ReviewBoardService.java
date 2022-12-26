package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.ReviewBoard;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface ReviewBoardService {

	//유저 정보 찾기
	public Users getUserInfo(int userno);
	
	//게시글 등록
	public void insertReview(ReviewBoard reviewBoard);

	//게시글 상세 보기
	public ReviewBoard view(ReviewBoard viewBoard);

	//게시글 수정
	public void update(ReviewBoard reviewBoard);

	//게시글 삭제
	public void delete(ReviewBoard reviewNo);

	//공지사항
	public List<Notice> notice(BoardSearch boardSearch);
	
	public int getTotal(BoardSearch boardSearch);

	public List<ReviewBoard> getSearchPaging(BoardSearch boardSearch);
	
	//포인트
	public int getPoint(int userno);

	public void updatePoint(int point);
	
	
	

}
