package hyanghee.service.face;

import java.util.List;


import hyanghee.dto.Beforeafter;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface BfBoardService {

	//페이징
	public BoardPaging getPaging(int curPage);

	//게시글 목록
	public List<Beforeafter> list(BoardPaging paging);
	
	//공지사항 목록
	public List<Notice> notice(BoardPaging paging);
	
	//게시글 작성
	public void insertBfBoard(Beforeafter bfBoard);

	//유저 정보 찾기
	public Users getUserInfo(int userno);

	//게시글 삭제
	public void delete(Beforeafter bfNo);

	//게시글 상세 보기
	public Beforeafter view(Beforeafter viewBoard);

	//게시글 수정
	public void update(Beforeafter beforeafter);

	public List<Beforeafter> getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);
	
	public Beforeafter getPage(int bfNo);

	//포인트
	public int getPoint(int userno);
	
	public void updatePoint(int point);
	

	
	
}
