package saebyeol.dao.face;

import java.util.List;

import saebyeol.dto.Notice;
import saebyeol.utill.SaebyeolPaging;
import saebyeol.utill.Search;

public interface NoticeDao {

	/**
	 * 전체 게시글 수를 조회한다.
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 게시글 목록
	 */
	public List<Notice> selectList(SaebyeolPaging paging);

	/**
	 * 조회하려는 게시글의 조회수 +1 증가
	 * @param viewNotice - 조회된 게시글 번호
	 */
	public void updateHit(Notice viewNotice);

	public List<Notice> getSearch(Search search);
	
	/**
	 * 게시글 번호를 이용해서 게시글 조회
	 * @param viewNotice - 조회하려는 게시글 번호
	 * @return - 조회된 게시글 정보
	 */
	public Notice selectNotice(Notice viewNotice);
	
	/**
	 * 작성된 게시글 DB에 삽입
	 * @param notice
	 * @return 
	 */
	public void insertNotice(Notice notice);
	
	/**
	 * 게시글 정보 수정
	 * @param notice
	 */
	public void updateNotice(Notice notice);

	/**
	 * 게시글 삭제
	 * @param notice
	 */
	public void delete(Notice notice);



}
