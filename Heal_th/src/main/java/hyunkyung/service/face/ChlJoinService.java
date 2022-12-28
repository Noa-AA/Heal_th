package hyunkyung.service.face;


import java.util.Map;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.MmoneyUse;
import hyunkyung.dto.ParticipantList;
import yerim.dto.Users;

public interface ChlJoinService {


	/**
	 * 챌린지 정보 조회
	 * @param challenge
	 * @return
	 */
	public Challenge selectInfo(int challengeNo);

	/**
	 * 유저 정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);

	/**
	 * 득근머니 잔액 조회
	 * @param userno
	 * @return
	 */
	public MmoneyUse getMmoney(int userno);

	
	/**
	 * 가입시 정보 저장
	 * @param pList - participantList
	 * @return
	 */
	public int insert(ParticipantList pList);

	public int selectParticipant(Map<String, Object> data);


	
	

	


}
