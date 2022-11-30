package hyanghee.service.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import hyanghee.dto.Beforeafter;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;

public interface BfBoardService {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public BoardPaging getPaging(int curPage);

	//게시글 목록
	public List<Beforeafter> list(BoardPaging paging);

	//게시글 작성
	public void insertBfBoard(Beforeafter bfBoard);

	//유저 정보 찾기
	public Users getUserInfo(int userno);
	
	






	



	

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
//	public List<Board> list(Paging paging);


	
	
}
