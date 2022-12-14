package yerim.dao.face;

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

}
