package hyanghee.service.face;

import java.util.List;

import hyanghee.dto.DietBoard;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface DietBoardService {

	//게시글 등록
	public void insertDietBoard(DietBoard dietBoard);

	//상세보기
	public DietBoard view(DietBoard viewBoard);

	//게시글 수정
	public void update(DietBoard dietBoard);
	
	//게시글 삭제
	public void delete(DietBoard dietNo);

	//유저 정보
	public Users getUserInfo(int userno);

	//공지사항
	public List<Notice> notice(BoardSearch boardSearch);

	//게시글 검색 
	public List<DietBoard> getSearchPaging(BoardSearch boardSearch);

	//전체 게시글 조회
	public int getTotal(BoardSearch boardSearch);

	//포인트
	public int getPoint(int userno);

	//포인트 + 50 주기
	public void updatePoint(int point);

}
