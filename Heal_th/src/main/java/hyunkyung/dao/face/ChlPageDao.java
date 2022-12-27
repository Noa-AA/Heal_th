package hyunkyung.dao.face;

import java.util.List;
import java.util.Map;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeContent;

import yerim.dto.Users;

public interface ChlPageDao {

	/**
	 * 유저번호에 따른 유저정보 데이터 조회
	 * 
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);

	/**
	 * 유저번호를 이용하여 가입한 챌린지 조회
	 * 
	 * @param userno
	 * @return
	 */
	public List<Challenge> selectjoinList(int userno);

	/**
	 * 챌린지 번호를 이용해 사진인증 페이지로 이동
	 * 
	 * @param challengeNo
	 * @return
	 */
	public Challenge getPage(int challengeNo);

	/**
	 * 챌린지 번호 별로 인증한 전체 사진 리스트 조회
	 * 
	 * @param challengeNo
	 * @return
	 */
	public List<ChallengeContent> getPhoto(int challengeNo);

	/**
	 * 파일 존재 여부 확인
	 * 
	 * @param chlFile - 파일
	 * @return
	 */
	public int selectFile(Map<String, Object> data);

	/**
	 * 파일 번호 조회하기
	 * 
	 * @param chlFile-파일번호
	 * @return
	 */
	public int selectfileNo(ChallengeContent chlFile);

	/**
	 * 파일 업데이트하기
	 * 
	 * @param chlFile
	 */
	public void updateFile(Map<String, Object> data);

	/**
	 * 인증파일 등록하기
	 * 
	 * @param chlFile
	 */
	public void insertFile(Map<String, Object> data);

}
