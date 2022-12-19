package yerim.dao.face;

import yerim.dto.PhotoFile;
import yerim.dto.Users;

public interface MypageDao {

	/**
	 * 회원 정보 조회하기
	 * @param userNo -유저번호
	 * @return -유저정보
	 */
	public Users selectUserInfo(int userNo);

	/**
	 * 회원 정보 업데이트 하기
	 * @param userInfo -입력된 회원 정보
	 */
	public void updateUserInfo(Users userInfo);

	/**
	 * 회원 아이디 조회하기
	 * @param userNo -회원 번호
	 * @return 회원 아이디 
	 */
	public String selectUserId(int userNo);
	/**
	 * 현재사용중인 비밀번호 조회하기
	 * @param updatePwInfo -회원 정보
	 * @return -true/false
	 */

	public int selectuserPw(Users updatePwInfo);

	/**
	 * 현재 사용중인 비밀번호 
	 * @param userPw -회원정보(아이디 제외)
	 * @return -true/false
	 */
	public int selectUserPwByUserNoPw(Users userPw);

	/**
	 * 새로 설정한 비밀번호 update
	 * @param userNewPw -새로 설정한 비밀번호,회원 번호
	 * @return 
	 */
	public void updateUserNewPw(Users userNewPw);

	/**
	 * 파일 존재여부 확인하기
	 * @param photoFile -파일 
	 */
	public int selectIsProfile(PhotoFile photoFile);

	/**
	 * 파일 업데이트하기
	 * @param photoFile
	 */
	public void updateProfile(PhotoFile photoFile);

	/**
	 * 파일 인서트 하기
	 * @param photoFile
	 */
	public void insertProfile(PhotoFile photoFile);
	/**
	 * 파일 번호 조회하기
	 * @param photoFile
	 * @return -파일 번호
	 */
	public int selectfileNo(PhotoFile photoFile);

	/**
	 * 회원 사진 조회해오기
	 * @param profile -회원 번호
	 * @return -storedName
	 */
	public PhotoFile selectStoredName(PhotoFile profile);

	/**
	 * 자기소개 작성된게 있는지 조회하기
	 * @param intro
	 * @return
	 */
	public int selectIsIntro(Users intro);

	/**
	 * 한줄 소개 update 하기 
	 * @param intro
	 */
	public void updateIntro(Users intro);

	/**
	 * 한줄 소개 조회하기
	 * @param user
	 * @return
	 */
	
	public Users selectUserIntro(Users user);

	/**
	 * 회원 탈퇴하기
	 * @param dropOut
	 */
	public void deleteByuserNoPw(Users dropOut);



}
