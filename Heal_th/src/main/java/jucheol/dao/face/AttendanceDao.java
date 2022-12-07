package jucheol.dao.face;

import jucheol.dto.Attendance;

public interface AttendanceDao {

	/**
	 * 회원번호를 이용해 마지막로그인접속기록 확인
	 * 
	 * @param attendance 회원번호 담겨있음
	 * @return
	 */
	public Attendance getLastLogin(Attendance attendance);


	/**
	 * 현재 접속시간을 기록
	 * @param attendance 회원번호,현재시간
	 * @return 
	 */
	public void addLoginDate(Attendance attendance);

}
