package jucheol.dto;

import java.sql.Date;
import java.time.LocalDate;

public class Attendance {
	
	private int attNo;
	private int userNo;
	private Date attDate;
	
	public Attendance() {	}

	public Attendance(int attNo, int userNo, Date attDate) {
		super();
		this.attNo = attNo;
		this.userNo = userNo;
		this.attDate = attDate;
	}

	@Override
	public String toString() {
		return "Attendance [attNo=" + attNo + ", userNo=" + userNo + ", attDate=" + attDate + "]";
	}

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getAttDate() {
		return attDate;
	}

	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}
	
	
}
