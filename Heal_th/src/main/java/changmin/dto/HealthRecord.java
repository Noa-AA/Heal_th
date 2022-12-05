package changmin.dto;

public class HealthRecord {

	private int recordNo;
	private String recordDate;
	private String recordCon;
	private int userNo;
	
	public HealthRecord() {}

	public HealthRecord(int recordNo, String recordDate, String recordCon, int userNo) {
		super();
		this.recordNo = recordNo;
		this.recordDate = recordDate;
		this.recordCon = recordCon;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "HealthRecord [recordNo=" + recordNo + ", recordDate=" + recordDate + ", recordCon=" + recordCon
				+ ", userNo=" + userNo + "]";
	}

	public int getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
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
