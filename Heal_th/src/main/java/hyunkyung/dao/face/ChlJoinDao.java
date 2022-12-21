package hyunkyung.dao.face;

import java.util.List;

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
	public MmoneyUse selectMmoney(int userno);

	
	/**
	 * 가입시 정보 저장
	 * @param pList - participantList
	 * @return
	 */
	public int insertInfo(ParticipantList pList);

	
	/**
	 * 예치금 입력
	 * @param mUse
	 * @return
	 */
//	public List<MmoneyUse> insertMoney(int mUse);
}
