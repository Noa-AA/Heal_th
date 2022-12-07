package hyanghee.service.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import hyanghee.dto.Beforeafter;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

public interface BfBoardService {

	
	public BoardPaging getPaging(int curPage);

	//게시글 목록
	public List<Beforeafter> list(BoardPaging boardPaging);

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
	
	






	


	
	
}
