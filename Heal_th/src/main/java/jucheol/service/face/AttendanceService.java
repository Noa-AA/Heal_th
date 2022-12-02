package jucheol.service.face;

import java.util.Date;

import jucheol.dto.Attendance;

public interface AttendanceService {

	/**
	 * 회원번호를 받아와 마지막 로그인 기록 확인
	 * 
	 * @param attendance 회원번호받아옴
	 * @return 
	 */
	public Attendance getLastLogin(Attendance attendance);

}
