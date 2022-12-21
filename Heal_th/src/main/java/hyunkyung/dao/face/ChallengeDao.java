package hyunkyung.dao.face;

import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeFile;
import hyunkyung.dto.ParticipantList;
import hyunkyung.util.ChlCriteria;
import yerim.dto.Users;

public interface ChallengeDao {

	/**
	 * 챌린지 목록
	 * @return
	 */
	public List<Challenge> getList();
	
	/**
	 * 페이징을 적용하여 챌린지 목록 조회
	 * @param cri - 페이지 기준 정보 객체
	 * @return 페이징이 적용된 챌린지 목록
	 */
    public List<Challenge> getListPaging(ChlCriteria cri);
    
    /**
     * 챌린지 상세보기
     * @param challengeNo - 조회된 챌린지 번호
     * @return
     */
    public Challenge getPage(int challengeNo);

	/**
	 * 전체 챌린지 수 조회
	 * 
	 * @param cri
	 * @return
	 */
	public int getTotal(ChlCriteria cri);

	/**
	 * 챌린지 삭제
	 * @param challenge - 삭제할 챌린지 번호
	 */
	public void delete(Challenge challenge);

	
	/**
	 * 챌린지 참여자 목록에서 유저번호 가져오기
	 * @param userno
	 * @return
	 */
//	public ParticipantList getUserInfo(int userno);

	
}
