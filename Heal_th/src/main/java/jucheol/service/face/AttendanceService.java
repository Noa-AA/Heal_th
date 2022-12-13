package jucheol.service.face;

import java.util.Date;
import java.util.List;

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

	/**
	 * 출석일 가져오기
	 * 
	 * @param attendance
	 * @return
	 */
	public List<Date> getAtt(Attendance attendance);

}
