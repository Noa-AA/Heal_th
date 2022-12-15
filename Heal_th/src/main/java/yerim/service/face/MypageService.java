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

}
