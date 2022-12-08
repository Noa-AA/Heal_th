package jucheol.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
			,@CookieValue(value="checkCookie", required = false) String checkCookie
			) {
		logger.info("/check/check[GET]");
		
		logger.info("checkCookieValue-{}", checkCookie);
		
		//세션에 최근(마지막) 접속 시간
//		Date lastSession = new Date(session.getLastAccessedTime());

		//세션Date를 LocalDate로 변환
//		LocalDate lastDate = LocalDate.of(Integer.parseInt(new SimpleDateFormat("yyyy").format(lastSession))
//											,Integer.parseInt(new SimpleDateFormat("MM").format(lastSession))
//											,Integer.parseInt(new SimpleDateFormat("dd").format(lastSession)));
		
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
		
//		logger.info("sessionIsNew?-{}",session.isNew());
		
		if(checkCookie==null) {
			//쿠키가 없을경우 마지막로그인 확인후 기록
			attendance = attendanceService.getLastLogin(attendance);
			
			logger.info("lastLogin-{}",attendance);
			
			LocalDate now = LocalDate.now(); //현재시간 담기
			logger.info("check-nowDate : {}", now);
			
			// LocalDate를 Date로 변환
			Date nowDate = java.sql.Date.valueOf(now);
		
			
//			System.out.println(attendance.getLastLogin().getClass().getName());
//			System.out.println(nowDate.getClass().getName());
			logger.info("lastLogin-{}",attendance.getAttDate());
			logger.info("nowDate-{}",nowDate);
			
			if(!attendance.getAttDate().equals(nowDate)) {
				attendance.setAttDate(nowDate);
				attendanceService.addLoginDate(attendance);
				
				logger.info("cookieIsNew!!-{}",attendance);
			}else {
				logger.info("금일 접속 기록 있음");
			}
				
		} else {
			logger.info("금일 접속 쿠키 있음");
		}
		
	
		
	}
	
	
	@GetMapping("/cookie")
	public void cookieTest(
			HttpServletResponse resp
			) {
		logger.info("/check/cookietest[GET]");

		Cookie checkCookie = new Cookie("checkCookie","check");
		
		//---쿠키 24시까지만 유지
		// 현재 시간
        LocalTime nowTime = LocalTime.now();
        
        // 현재시간 초 단위 변환
        int nowSecond = nowTime.getHour()*60*60;
        nowSecond += nowTime.getMinute()*60;
        nowSecond += nowTime.getSecond();
        
        int daySecond = 24 * 60 * 60;
        
        int leftCookieTime = daySecond - nowSecond;
        
        logger.info("cookietest-daySecond : {}",daySecond);
        logger.info("cookietest-nowSecond : {}",nowSecond);
        logger.info("cookietest-leftCookieTime : {}",leftCookieTime);
		
        checkCookie.setMaxAge(leftCookieTime);
		logger.info("checkCookie-MaxAge : {}",checkCookie.getMaxAge());
        
		logger.info("cookieTestValue - {}",checkCookie.getValue());
		
		resp.addCookie(checkCookie);
		
	}
}
