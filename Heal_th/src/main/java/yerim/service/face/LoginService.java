package yerim.service.face;

import yerim.dto.Users;

public interface LoginService {

	/**
	 * 회원가입 정보 insert하기
	 * @param joinInfo -회원가입 정보 파라미터
	 */
	public void setJoinInfo(Users joinInfo);

}
