package hyunkyung.service.face;

import java.util.List;

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


	
	
	/**
	 * 득근머니 사용금액(예치금) 입력
	 * @param mUse
	 * @return
	 */
//	public List<MmoneyUse> insertMoney(int mUse);

	


}
