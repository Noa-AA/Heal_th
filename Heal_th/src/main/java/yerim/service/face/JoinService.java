package yerim.service.face;

import yerim.dto.SmsResponse;
import yerim.dto.Users;

public interface JoinService {

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

/**
 * 본인인증을 위한 문자 보내기
 * @param recivedPhoneNumber -입력된 전화번호
 * @param title -제목
 * @param content -내용
 * @return
 */

	public SmsResponse sendSms(String recivedPhoneNumber,String content);

}
