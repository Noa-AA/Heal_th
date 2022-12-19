package hyunkyung.dao.face;

import java.util.ArrayList;
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
	 * 유저번호를 이용하여 가입한 챌린지 조회
	 * @param userno
	 * @return
	 */
	public List<Challenge> selectjoinList(int userno);

	/**
	 * 내가 가입한 챌린지 총 갯수
	 * @return
	 */
//	public Challenge getTotal(int userno);


	
	
	
	

	
	
	
	


	


}
