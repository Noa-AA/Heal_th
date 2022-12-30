package jucheol.controller;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
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
	public void getCheck(
			HttpSession session
			, Attendance attendance
			, Model model
			) {
		logger.info("/check/check[GET]");
		
		
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
//		session.setAttribute("userNo", 7777);
		
		attendance.setUserNo((int) session.getAttribute("userNo"));
		
//		logger.info("sessionIsNew?-{}",session.isNew());
		
		

		LocalDate now = LocalDate.now(); //현재시간 담기
		logger.info("check-nowDate : {}", now);
		
		//Localdate를 util.date로 변환
		Instant instant = now.atStartOfDay(ZoneId.systemDefault()).toInstant();
        Date nowDate = Date.from(instant);
		
        SimpleDateFormat dateY = new SimpleDateFormat("yyyy");
		SimpleDateFormat dateM = new SimpleDateFormat("MM");
		SimpleDateFormat dateD = new SimpleDateFormat("dd");
		
		//당월 마지막날짜 구하기
		Calendar cal = Calendar.getInstance();
//		cal.set(2024,1,1);
		cal.set(Integer.parseInt(dateY.format(nowDate)),Integer.parseInt(dateM.format(nowDate))-1,1);

		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		logger.info("이번달 마지막날 - {}",lastDay);
		
		//출석일 불러오기
		List<Date> attList = attendanceService.getAtt(attendance);
		
		//출석일 담을 int List
		ArrayList<Integer> attDays = new ArrayList<Integer>();
		
		//Date -> int 변환후 intList에 담기
		for( Date d : attList )	attDays.add(Integer.parseInt(dateD.format(d)));
		
		int today = Integer.parseInt(dateD.format(nowDate));
//		
		model.addAttribute("today", today);
		model.addAttribute("attDays",attDays);
		model.addAttribute("lastDay",lastDay);
	}
	
	@PostMapping("/check")
	public void insertCheck(
			HttpSession session
			, Attendance attendance
			, Model model
			,@CookieValue(value="checkCookie", required = false) String checkCookie
			) {
		LocalDate now = LocalDate.now(); //현재시간 담기
		logger.info("check-nowDate : {}", now);
		//---------------테스트용 유저정보 삽입
//		session.setAttribute("userNo", 7777);
		
		attendance.setUserNo((int) session.getAttribute("userNo"));
		System.out.println(attendance);
		if(checkCookie==null) {
			//쿠키가 없을경우 마지막로그인 확인후 기록
			attendanceService.getLastLogin(attendance);
			
			logger.info("lastLogin-{}",attendance);
			
			
			// LocalDate를 sql.Date로 변환
			java.sql.Date loginDate = java.sql.Date.valueOf(now);
			logger.info("loginDate-{}",loginDate);
		
			if(attendance.getAttDate()==null) {
				//첫 로그인일경우
				attendance.setAttDate(loginDate);
				attendanceService.addLoginDate(attendance);
				
				logger.info("cookieIsNew!!-{}",attendance);
			}else {
				//로그인 기록이 있을경우 마지막 로그인날짜와 금일비교
				if(!attendance.getAttDate().equals(loginDate)) {
					attendance.setAttDate(loginDate);
					attendanceService.addLoginDate(attendance);
					
					logger.info("cookieIsNew!!-{}",attendance);
				}else {
					logger.info("금일 접속 기록 있음");
				}
			}
			
				
		} else {
			logger.info("금일 접속 쿠키 있음");
		}
	}
	
	@GetMapping("/cookie")
	public void cookieTest(
			HttpServletResponse resp //-----------이거
			, HttpSession session
			) {
		logger.info("/check/cookietest[GET]");
		
		int userNo = (int) session.getAttribute("userNo");
		//------------여기부터
		Cookie checkCookie = new Cookie("checkCookie"+userNo,"check"+userNo);
		
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
		checkCookie.setPath("/main");
		resp.addCookie(checkCookie);
		
		//-----------여기까지
	}
}
