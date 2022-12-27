package hyanghee.service.face;

import java.util.List;


import hyanghee.dto.Beforeafter;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface BfBoardService {

	//공지사항 목록
	public List<Notice> notice(BoardSearch boardSearch);
	
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

	//게시글 목록
	public List<Beforeafter> getSearchPaging(BoardSearch boardSearch);

	//전체 게시글 조회
	public int getTotal(BoardSearch boardSearch);

	//포인트
	public int getPoint(int userno);
	
	//포인트 + 50 주기
	public void updatePoint(int point);



}
