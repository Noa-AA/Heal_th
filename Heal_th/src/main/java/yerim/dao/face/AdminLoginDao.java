package yerim.dao.face;

import yerim.dto.Admin;

public interface AdminLoginDao {

	/**
	 * 관리자 계정 로그인하기
	 * @param admin -입력된 아이디 pw
	 * @return - true/false
	 */
	public int chkLogin(Admin admin);

	/**
	 * 관리자 번호 조회하기
	 * @param admin -관리자가 입력한 아이디 비밀번호
	 * @return -관리자번호
	 */
	public int selectAdminNo(Admin admin);

}
