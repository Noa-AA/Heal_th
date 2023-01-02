package saebyeol.service.face;

import java.util.List;

import saebyeol.dto.Criteria;
import saebyeol.dto.Notice;

public interface NoticeService {

	//게시판 페이징 적용 리스트
	public List<Notice> getPaging(Criteria cri);

	//게시판 리스트
	public List<Notice> list();
	
	//게시판 총 개수
	public int getTotal(Criteria cri);

	//게시판 상세
	public Notice view(Notice viewNotice);

	//게시판 작성
	public void write(Notice notice);

	//게시판 수정
	public void update(Notice notice);

	//게시판 삭제
	public void delete(Notice notice);
	

}
