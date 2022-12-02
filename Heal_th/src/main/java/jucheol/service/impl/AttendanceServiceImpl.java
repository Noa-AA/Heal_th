package jucheol.service.impl;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jucheol.dao.face.AttendanceDao;
import jucheol.dto.Attendance;
import jucheol.service.face.AttendanceService;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//DAO 객체
	@Autowired AttendanceDao attendanceDao;
	
	@Override
	public Attendance getLastLogin(Attendance attendance) {
		Attendance lastLogin = attendanceDao.getLastLogin(attendance);
		
		logger.info("{}",lastLogin);
		return lastLogin;
	}


}
