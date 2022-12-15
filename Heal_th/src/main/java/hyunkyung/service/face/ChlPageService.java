package hyunkyung.service.face;

import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ParticipantList;
import yerim.dto.Users;

public interface ChlPageService {

	/**
	 * 유저 정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);

	/**
	 * 챌린지 정보 조회
	 * @param challengeNo
	 * @return
	 */
	public Challenge selectChlInfo(Challenge challenge);

	/**
	 * 참여자 목록 조회
	 * @param participantNo
	 * @return
	 */
	public ParticipantList selectPList(ParticipantList participantList);





}
