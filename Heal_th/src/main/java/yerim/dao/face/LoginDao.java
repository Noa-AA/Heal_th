package yerim.dao.face;

import yerim.dto.Users;

public interface LoginDao {

	/**
	 * 로그인을 위한 아이디 및 비밀번호 조회
	 * @param login -로그인 파라미터
	 * @return - 조회된 정보 갯수
	 */
	public int selectIdPw(Users login);

	/**
	 * userno 조회해오기
	 * @param login 
	 * @return
	 */
	public int selectUserno(Users login);

	/**
	 * 회원 존재 여부 확인하기
	 * @param searchId
	 * @return
	 */
	public int selectUser(Users searchId);

}
