package hyunkyung.dao.face;

import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ParticipantList;
import yerim.dto.Users;

public interface ChlPageDao {

	/**
	 * 유저번호에 따른 유저정보 데이터 조회
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);

	/**
	 * 챌린지 번호에 따른 챌린지 정보 조회
	 * @param challengeNo
	 * @return
	 */
	public Challenge selectChlInfo(Challenge challenge);

	/**
	 * 챌린지 참여자 목록 조회
	 * @param participantNo
	 * @return
	 */
	public ParticipantList selectPInfo(ParticipantList participantList);


	


}
