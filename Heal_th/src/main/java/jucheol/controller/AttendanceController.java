package jucheol.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jucheol.dto.Attendance;
import jucheol.service.face.AttendanceService;

@Controller
@RequestMapping("/check")
public class AttendanceController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private AttendanceService attendanceService;
	
	@GetMapping("/check")
	public void check(
			HttpSession session
			, Attendance attendance
			) {
		
		
		LocalDate nowDate = LocalDate.now(); //현재시간 담기
		System.out.println(nowDate);
		
		//세션에 최근(마지막) 접속 시간
		Date lastSession = new Date(session.getLastAccessedTime());

		//세션Date를 LocalDate로 변환
		LocalDate lastDate = LocalDate.of(Integer.parseInt(new SimpleDateFormat("yyyy").format(lastSession))
											,Integer.parseInt(new SimpleDateFormat("MM").format(lastSession))
											,Integer.parseInt(new SimpleDateFormat("dd").format(lastSession)));
		
//		System.out.println(lastDate); //포맷적용 마지막접속시간

		//현재시간, 세션마지막 시간 데이터타입 확인용
//		System.out.println(now.isBefore(lastSession));
//		System.out.println(nowDate.equals(lastSession));
		
//		nowDate = LocalDate.of(2022,12,3); //현재시간 테스트용
		//현재시간, 세션마지막 접속시간 비교
//		System.out.println(nowDate.compareTo(lastDate));
		
		//세션이 새롭게 생성된 건지 확인
//		System.out.println("isNew : " + session.isNew());
		
		//세션 삭제
//		session.invalidate();
		
		//---------------테스트용 유저정보 삽입
		session.setAttribute("userNo", 7777);
		
		attendance.setUserNo((int) session.getAttribute("userNo"));
		
		logger.info("sessionIsNew?-{}",session.isNew());
		
		if(session.isNew()) {
			//세션이 새로 만들어졌을경우 세션삭제후 재접속했는지 DB확인
			
			attendance = attendanceService.getLastLogin(attendance);
			
			logger.info("sessionIsNew!!-{}",attendance);
		} else {
			//세션이 이미 있지만 재접속일 경우 마지막 접속 시간확인
			if(nowDate.compareTo(lastDate) > 0 ) {	//현재접속일 > 마지막 접속일 일경우
				
			}//else 세션 있고, 접속기록 있으니 패스
		}
		

		
	}
}
