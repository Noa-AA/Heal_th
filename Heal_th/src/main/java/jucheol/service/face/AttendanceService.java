package jucheol.service.face;

import jucheol.dto.Attendance;

public interface AttendanceService {

	/**
	 * 회원번호를 받아와 마지막 로그인 기록 확인
	 * 
	 * @param attendance 회원번호받아옴
	 * @return 
	 */
	public Attendance getLastLogin(Attendance attendance);


	/**
	 * 현재 시간 담기
	 * @param attendance 회원번호,현재시간
	 * @return 
	 */
	public void addLoginDate(Attendance attendance);

}
