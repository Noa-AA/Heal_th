package jucheol.dao.face;

import java.util.Date;

import jucheol.dto.Attendance;

public interface AttendanceDao {

	/**
	 * 회원번호를 이용해 마지막로그인접속기록 확인
	 * 
	 * @param attendance 회원번호 담겨있음
	 * @return
	 */
	public Attendance getLastLogin(Attendance attendance);

}
