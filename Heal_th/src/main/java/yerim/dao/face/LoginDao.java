package yerim.dao.face;


import yerim.dto.Users;

public interface LoginDao {

	int updatePw = 0;

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
	public Users selectByIdForEamil(Users searchId);

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

	public Users selectByNamePhone(Users searchIdBySms);

	 /**
	  * 비밀번호 찾기를 위한 회원 존재여부  조회
	  * @param searchPw -회원이 기입한 회원 정보
	  * @return - 회원의 수 
	  */
	 
	public int selectUserIdForPw(Users searchPw);

	
	/**
	 * 입력한 새비밀번호와 기존 번호가 같은지 비교하여 조회하기
	 * @param updatePw -사용자가 입력한 비밀번호
	 * @return - 같은 비밀번호가 있는 갯수
	 */
	public int selectByPw(Users updatePw);

	/**
	 * 회원 비밀번호 새로 재설정
	 * @param userUpdatePw-입력된 회원 정보
	 * @return-입력된 결과
	 */
	public int updateNewPw(Users userUpdatePw);

	/**
	 * 네이버로그인 -회원 존재여부 확인
	 * @param userName -회원 이름
	 * @param userPhone -회원 전화번호
	 * @return -ture/false
	 */
	public int isNaverJoin(Users userproFile);

	/**
	 * 네이버 로그인
	 * @param userproFile
	 * @return
	 */
	public int loginByNaver(Users userproFile);

	/**
	 * 회원 가입 여부 확인하기
	 * @param kakaoUserInfo -회원 정보
	 * @return -true/false
	 */
	public int iskakaoLogin(Users kakaoUserInfo);

	/**
	 * 회원 번호 조회하기
	 * @param kakaoUserInfo -카카오에서 받은 회원 정보
	 * @return -회원 번호 
	 */
	public int selectuserNoForKakao(Users kakaoUserInfo);


	
	
	

}
