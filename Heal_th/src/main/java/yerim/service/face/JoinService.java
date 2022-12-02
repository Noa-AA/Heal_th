package yerim.service.face;

import com.fasterxml.jackson.core.JsonProcessingException;

import yerim.dto.Request;
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
	 * 본인인증 요청 메시지 보내기 -API연결
	 * @param userPhone - 입력한 전화번호 
	 * @return -보낸 랜덤 난수 
	 * @throws JsonProcessingException 
	 */

	public String sendRan(Users userPhone);


}
