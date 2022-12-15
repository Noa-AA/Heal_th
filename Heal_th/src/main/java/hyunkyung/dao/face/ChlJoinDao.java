package hyunkyung.dao.face;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.MmoneyUse;
import hyunkyung.dto.ParticipantList;
import yerim.dto.Users;

public interface ChlJoinDao {

	/**
	 * 가입시 챌린지 정보 조회
	 * @param challenge
	 * @return
	 */
	public Challenge selectChlInfo(int challengeNo);

	/**
	 * 유저번호에 따른 유저정보 데이터 조회
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);


	/**
	 * 득근머니 잔여 포인트 조회
	 * @param userno
	 * @return
	 */
	public int selectMmoney(int userno);
//	public MmoneyUse selectMmoney(int mNo);
	
	/**
	 * 가입시 정보 저장
	 * @param pList - participantList
	 * @return
	 */
	public int insertInfo(ParticipantList pList);

	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//	public Integer getMcharge(int mmoney);
}
