package hyanghee.service.face;

import java.util.List;


import hyanghee.dto.Beforeafter;
import hyanghee.util.BoardPaging;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface BfBoardService {

	public BoardPaging getPaging(String curPage);

	public List<Beforeafter> getList(BoardPaging paging);

	public List<Notice> notice(BoardPaging paging);

	public BoardPaging getSearchPaging(BoardPaging paging, String curPage);

	public List<Beforeafter> searchList(BoardPaging paging);
	
	public Users getUserInfo(int userno);
	
	public int getPoint(int userno);
	
	public void updatePoint(int point);
	
	public void insertBfBoard(Beforeafter bfBoard);
	
	public Beforeafter view(Beforeafter viewBoard);
	
	public void update(Beforeafter beforeafter);
	
	public void delete(Beforeafter bfNo);
	



//	//페이징
//	public BoardPaging getPaging(int curPage);
//
//	//게시글 목록
//	public List<Beforeafter> list(BoardPaging paging);
//	
//	//공지사항 목록
//	public List<Notice> notice(BoardPaging paging);
//	
//	//게시글 작성
//	public void insertBfBoard(Beforeafter bfBoard);
//
//	//유저 정보 찾기
//	public Users getUserInfo(int userno);
//
//	//게시글 삭제
//	public void delete(Beforeafter bfNo);
//
//	//게시글 상세 보기
//	public Beforeafter view(Beforeafter viewBoard);
//
//	//게시글 수정
//	public void update(Beforeafter beforeafter);
//
//	//게시글 목록
//	public List<Beforeafter> getSearchPaging(BoardSearch boardSearch);
//
//	//전체 게시글 조회
//	public int getTotal(BoardSearch boardSearch);
//	
////	public List<Beforeafter> getList();
//	
////	public Beforeafter getPage(int bfNo);
//
//	//포인트
//	public int getPoint(int userno);
//	
//	public void updatePoint(int point);	

	
	
}
