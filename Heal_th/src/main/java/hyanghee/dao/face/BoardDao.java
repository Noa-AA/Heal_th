package hyanghee.dao.face;

import java.util.List;

import hyanghee.dto.Board;
import hyanghee.util.Paging;

public interface BoardDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	//비포 애프터 게시글 생성
	public void insertBfBoard(Board board);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
//	public List<Board> selectList(Paging paging);

}
