package saebyeol.service.face;

import java.util.List;

import saebyeol.dto.Notice;
import saebyeol.utill.SaebyeolPaging;

public interface NoticeService {

	//페이징 처리
	public SaebyeolPaging getPaging(int curPage);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Notice> list(SaebyeolPaging paging);

}
