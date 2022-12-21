package hyunkyung.dao.face;

import java.util.ArrayList;
import java.util.List;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeFile;
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
	 * 챌린지 번호를 이용해 사진인증 페이지로 이동
	 * @param challengeNo
	 * @return
	 */
	public Challenge getPage(int challengeNo);


	/**
	 * 회원이 인증한 사진 리스트 조회
	 * @param userno
	 * @return
	 */
	public List<ChallengeFile> getPhoto(int challengeNo);


	/**
	 * 전달된 파일 정보 삽입
	 * @param filetest
	 */
//	public void insertFile(ChallengeFile filetest);

	
	
	
	

	
	
	
	


	


}
