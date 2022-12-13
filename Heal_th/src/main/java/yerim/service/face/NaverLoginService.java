package yerim.service.face;


import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;

import yerim.dto.Users;


public interface NaverLoginService {

	/**
	 * 요청을 위한
	 * @param session
	 * @return
	 */
	public String getURL(HttpSession session);
	
	/**
	 * access_Token 받기
	 * @param session
	 * @param code
	 * @param state 
	 * @return
	 * @throws JsonProcessingException 
	 */

	public String getToken(HttpSession session, String code, String state) ;

	/**
	 * 부여받은 토큰으로 회원 정보 받아오기
	 * @param getToken -부여받은 토큰
	 * @return - 회원 정보 
	 */
	public Users getUserProfile(String getToken);
	
	/**
	 * 회원 가입 여부 조회하기
	 * @param userName -회원 이름
	 * @param userPhone-회원 전화번호 
	 * @return -가입 여구 
	 */

	public boolean getIsJoin(Users userproFile);

	/**
	 * 네이버 회원 로그인
	 * @param userproFile
	 * @return -회원 번호 
	 */
	public int naverLogin(Users userproFile);

//	/**
//	 * 회원 가입하기
//	 * @param userproFile -유저정보
//	 */
//	public void joinNaver(Users userproFile);

}
