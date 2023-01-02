package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.VerifyBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface VerifyBoardService {

	//게시글 작성
	public void insertVerifyBoard(VerifyBoard verifyBoard);

	//게시글 상세 보기
	public VerifyBoard view(VerifyBoard viewBoard);

	//게시글 수정
	public void update(VerifyBoard verifyBoard);

	//게시글 삭제
	public void delete(VerifyBoard verifyNo);

	//유저 정보
	public Users getUserInfo(int userno);

	//포인트 찾기
	public int getPoint(int userno);

	//포인트 적립
	public void updatePoint(int point);

	//공지사항
	public List<Notice> notice(BoardSearch boardSearch);

	//검색
	public int getTotal(BoardSearch boardSearch);

	public List<VerifyBoard> getSearchPaging(BoardSearch boardSearch);

}
