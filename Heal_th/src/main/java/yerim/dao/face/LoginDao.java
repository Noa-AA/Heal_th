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

	/**
	 * 이름,이메일과 일치하는 아이디 조회해오기
	 * @param session
	 * @param searchId
	 * @return
	 */
	public String selectById(Users searchId);

	/**
	 * 이름,전화번호로 일치하는 회원 여부 확인하기
	 * @param searchBySms
	 * @return
	 */
	public int selectUserBySms(Users searchBySms);
	
	 /** 문자이증을 통한 아이디 찾기 (아이디 조회)
	 * @param searchIdBySms
	 * @return -조회한 아이디
	 */

	public String selectByNamePhone(Users searchIdBySms);

	 /**
	  * 비밀번호 찾기를 위한 회원 존재여부  조회
	  * @param searchPw -회원이 기입한 회원 정보
	  * @return - 회원의 수 
	  */
	 
	public int selectUserIdForPw(Users searchPw);

}
