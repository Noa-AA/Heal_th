package hyunkyung.dao.face;

import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.util.Paging;

public interface ChallengeDao {
	
	/**
	 * 전체 챌린지 수를 조회
	 * @return 총 챌린지 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 챌린지 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 챌린지 목록
	 */
	public List<Challenge> selectList(Paging paging);

	/**
	 * 챌린지 번호를 이용하여 챌린지 조회
	 * @param viewChallenge - 조회하려는 챌린지 번호
	 * @return 조회된 챌린지 정보
	 */
	public Challenge selectChallenge(Challenge viewChallenge);

	
	

}
