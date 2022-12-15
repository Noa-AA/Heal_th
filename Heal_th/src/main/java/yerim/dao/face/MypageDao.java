package yerim.dao.face;

import yerim.dto.Users;

public interface MypageDao {

	/**
	 * 회원 정보 조회하기
	 * @param userNo -유저번호
	 * @return -유저정보
	 */
	public Users selectUserInfo(int userNo);

}
