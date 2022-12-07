package hyunkyung.service.face;

import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeFile;
import hyunkyung.util.ChlCriteria;

public interface ChallengeService {

	/**
	 * 챌린지 목록
	 * @return
	 */
	public List<Challenge> getList();
	
	/**
	 * 페이징이 적용된 챌린지 목록 조회
	 * @param cri - 페이지 기준
	 * @return 페이징이 적용된 챌린지 목록
	 */
	public List<Challenge> getListPaging(ChlCriteria cri);
	
	/**
	 * 챌린지 상세보기
	 * @param challengeNo - 상세조회할 챌린지 번호 객체
	 * @return 조회된 상세 챌린지 객체
	 */
	public Challenge getPage(int challengeNo);
	
	/**
	 * 챌린지 총 갯수
	 * @param cri
	 * @return
	 */
	public int getTotal(ChlCriteria cri);
}
