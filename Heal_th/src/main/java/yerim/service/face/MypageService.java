package yerim.service.face;

import javax.servlet.http.HttpSession;

import yerim.dto.Users;

public interface MypageService {
	
	/**
	 * 회원 정보 조회해오기
	 * @param userNo -유저넘버
	 * @return -회원 정보
	 */
	public Users getuserInfo(int userNo);

	/**
	 * 이메일 인증 보내기 요청
	 * @param userEmail -회원이 입력한 이메일 주소
	 * @return -이메일 코드
	 */
	public String sendEmailCode(Users userEmail);

	/**
	 * 이메일 인증 코드 검증하기
	 * @param session - 생성된 코드
	 * @param emailCode -입력된 코드
	 * @return - true/false
	 */
	public boolean chkEmailCode(HttpSession session, String emailCode);

	/**
	 * 문자로 인증번호 보내기
	 * @param userPhone -회원 전화번호
	 * @return -인증번호
	 */
	public String sendSmsCode(Users userPhone);

	/**
	 * 인증번호 검증하기
	 * @param session -생성된 인증번호
	 * @param smsCode - 입력된 인증번호 
	 * @return -true/false
	 */
	public boolean chkSmsCode(HttpSession session, String smsCode);

	/**
	 * 수정된 회원 정보 업데이트 하기
	 * @param userInfo -입력된 회원 정보
	 */
	public void updateInfo(HttpSession session,Users userInfo);

	/**
	 * 비밀번호 변경 페이지에 표시할 회원 아이디 조회하기
	 * @param userNo -회원 번호 
	 * @return -회원 아이디
	 */
	public String getuserId(int userNo);
	
	/**회원 비밀번호 조회하기
	 * 
	 * @param updatePwInfo -입력된 비밀번호, 아이디
	 * @param session -세션에 저장된 회원번호
	 * @return -true/false
	 */

	public boolean getuserPw(Users updatePwInfo, HttpSession session);

	
	/**
	 * 현재사용중인 비밀번호 확인하기
	 * @param userPw -회원이 입력한 비밀번호
	 * @param session -유저 넘버
	 * @return -ture/false
	 */
	public boolean getchkPw(Users userPw, HttpSession session);

	/**
	 * 새로 입력한 비밀번호 업데이트하기
	 * @param userNewPw -입력한 비밀번호
	 * @param session -회원 no
	 * @return 
	 */
	public void updateNewPw(Users userNewPw, HttpSession session);

}
