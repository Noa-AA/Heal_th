package yerim.service.face;

import yerim.dto.Users;

public interface KakaoLoginService {

	/**
	 * 카카오 로그인 서비스를 위한 인가 요청 주소
	 * @return -요청 URL
	 */
	public String getURL();

	/**
	 * 인가받은 코드로 토큰 access_token 얻기
	 * @param code
	 * @return
	 */
	public String getToken(String code);

	/**
	 * 회원 정보 요청하기
	 * @param getKakaoToken -카카오 접큰 토큰
	 * @return -DTO에 담긴 회원 정보
	 */
	public Users getuserInfo(String getKakaoToken);

	/**
	 * 가입된 아이디인지 확인하기
	 * @param kakaoUserInfo -회원 정보
	 * @return -turue/false
	 */
	public boolean isLogin(Users kakaoUserInfo);

	/**
	 * 로그인하기
	 * @param kakaoUserInfo -카카오에서 받은 회원정보
	 * @return-회원번호
	 */
	public int getuserNo(Users kakaoUserInfo);

}
