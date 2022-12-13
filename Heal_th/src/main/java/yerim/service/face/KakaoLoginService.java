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

}
