package jucheol.dto;

import java.util.Date;

public class Attendance {
	
	private int attNo;
	private Date lastLogin;
	private int userNo;
	
	public Attendance() {	}

	public Attendance(int attNo, Date lastLogin, int userNo) {
		super();
		this.attNo = attNo;
		this.lastLogin = lastLogin;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Attendance [attNo=" + attNo + ", lastLogin=" + lastLogin + ", userNo=" + userNo + "]";
	}

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
	
}
