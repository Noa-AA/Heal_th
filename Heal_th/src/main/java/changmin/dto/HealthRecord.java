package changmin.dto;

import java.util.Date;

public class HealthRecord {

	private int recordNo;
	private Date recordDate;
	private String recordCon;
	private int userNo;
	
	public HealthRecord() {}

	@Override
	public String toString() {
		return "HealthRecord [recordNo=" + recordNo + ", recordDate=" + recordDate + ", recordCon=" + recordCon
				+ ", userNo=" + userNo + "]";
	}

	public HealthRecord(int recordNo, Date recordDate, String recordCon, int userNo) {
		super();
		this.recordNo = recordNo;
		this.recordDate = recordDate;
		this.recordCon = recordCon;
		this.userNo = userNo;
	}

	public int getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}

	public Date getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	public String getRecordCon() {
		return recordCon;
	}

	public void setRecordCon(String recordCon) {
		this.recordCon = recordCon;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
