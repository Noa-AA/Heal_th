package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.DietBoard;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface DietBoardDao {

	//총 게시글 수
	public int selectCntAll();

	//게시글 등록
	public void insertDietBoard(DietBoard dietBoard);

	//유저정보
	public Users selectUserInfo(int userno);

	//게시글 상세보기
	public DietBoard selectBoard(DietBoard viewBoard);

	//게시글 수정
	public void updateBoard(DietBoard dietBoard);

	//게시글 삭제
	public void delete(DietBoard dietNo);
	
	//공지사항
	public List<Notice> notice(BoardSearch boardSearch);

	//검색 / 목록
	public List<DietBoard> getSearchPaging(BoardSearch boardSearch);

	//전체 게시글
	public int getTotal(BoardSearch boardSearch);
	
	//조회수
	public void updateHit(DietBoard viewBoard);

	//포인트
	public int getPoint(int userno);

	public void updatePoint(Users users);
	
}
