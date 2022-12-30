package saebyeol.dao.face;

import java.util.List;

import saebyeol.dto.Criteria;
import saebyeol.dto.Notice;
import saebyeol.utill.Search;

public interface NoticeDao {

	//게시판 총 개수
	public int getTotal(Criteria cri);

	//게시판 목록
	public List<Notice> getList();
	
	//게시판 페이징 목록
	public List<Notice> getPaging(Criteria cri);

	//조회수 증가
	public void updateHit(Notice viewNotice);

	public List<Notice> getSearch(Search search);
	
	//게시판 상세
	public Notice selectNotice(Notice viewNotice);
	
	//게시판 db에 저장
	public void insertNotice(Notice notice);
	
	//게시판 수정
	public void updateNotice(Notice notice);

	//게시판 삭제
	public void delete(Notice notice);




}
