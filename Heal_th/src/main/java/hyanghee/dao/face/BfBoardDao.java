package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.Beforeafter;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

public interface BfBoardDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Beforeafter> selectList(BoardSearch boardSearch);
	
	/**
	 * 게시글 작성 - 등록
	 * @param bfBoard
	 */
	public void insertBfBoard(Beforeafter bfBoard);

	/**
	 * 유저 정보 찾기 - userno
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);
	
	//게시글 삭제
	public void delete(Beforeafter bfNo);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Beforeafter selectBoard(Beforeafter viewBoard);

	//게시글 수정
	public void updateBoard(Beforeafter beforeafter);

//	public List<Beforeafter> getList();
	
	public List<Beforeafter> getSearchPaging(BoardSearch boardSearch);

	public int getTotal(BoardSearch boardSearch);

	//공지사항 목록
	public List<Notice> notice(BoardSearch boardSearch);

	//조회수
	public void updateHit(Beforeafter viewBoard);

	//포인트
	public int getPoint(int userno);

	public void updatePoint(Users users);

	public String selectUserNick(int userno);



	
}
