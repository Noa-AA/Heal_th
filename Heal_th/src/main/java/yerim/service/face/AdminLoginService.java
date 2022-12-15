package yerim.service.face;

import yerim.dto.Admin;

public interface AdminLoginService {

	/**
	 * 관리자 로그인
	 * @param admin - 관리가 입력한 로그인 정보
	 * @return -true/false
	 */
	public boolean isLogin(Admin admin);

	/**
	 * 관리자번호 조회하기
	 * @param admin -관리자가 입력한 아이디 비밀번호
	 * @return -관리자 번호
	 */
	public int getadminNo(Admin admin);

}
