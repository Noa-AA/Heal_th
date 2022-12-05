package hyunkyung.service.face;

import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.util.Paging;

public interface ChallengeService {

	/**
	 * 챌린지 목록을 위한 페이징 객체 생성
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두가지 데이터 활용하여 페이징 객체 생성하여 반환
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징이 적용된 챌린지 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 챌린지 목록
	 */
	public List<Challenge> list(Paging paging);

	/**
	 * 챌린지 상세보기
	 * 
	 * @param viewChallenge - 상세조회할 챌린지 번호 객체
	 * @return
	 */
	public Challenge view(Challenge viewChallenge);

	
}
