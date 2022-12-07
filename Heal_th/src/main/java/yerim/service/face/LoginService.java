package yerim.service.face;

import yerim.dto.Users;

public interface LoginService {

	/**
	 * 로그인을 위한 정보 확인하기 
	 * @param login -id,pw 정보를 담은 dto
	 * @return - 가입된 아이디 존재 여부 
	 */
	public boolean checkLogin(Users login);

	/**
	 * 로그인 시 세션에 저장할 userNo조회하기
	 * @param login 
	 * @return - userNo
	 */
	public int getUserNo(Users login);

	/**
	 * 아이디찾기 시 일치하는 회원 있는지 확인하기
	 * @param searchId -아이디 찾기 시 작성된 파라미터
	 * @return -회원 존재 여부 
	 */
	public boolean searchUser(Users searchId);

}
