package jucheol.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daeyeon.dao.face.AdminUserDao;
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
		
		return attendanceDao.getLastLogin(attendance);
	}
	@Autowired AdminUserDao adminUserDao;
	@Override
	public void addLoginDate(Attendance attendance) {
		attendanceDao.addLoginDate(attendance);
		attendanceDao.updatePoint(attendance.getUserNo());
		adminUserDao.updateRnoByPoint(attendance.getUserNo());
	}

	@Override
	public List<Date> getAtt(Attendance attendance) {
		return attendanceDao.getAtt(attendance);
	}



}
