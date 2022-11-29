package yerim.service.face;

import yerim.dto.Users;

public interface LoginService {

	/**
	 * 회원가입 정보 insert하기
	 * @param joinInfo -회원가입 정보 파라미터
	 */
	public void setJoinInfo(Users joinInfo);

	
	
	/**
	 * 입력된 아이디 중복 확인하기 
	 * @param chkId-중복확인할 아이디
	 */
	public int checkById(Users userId);

}
