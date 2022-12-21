package jucheol.dto;

public class Report {

	private int reportNo;
	private int userNo;
	private int boardNo;
	private int categoryNo;
	private String categoryName; 
	private String title;
	
	public Report() {	}

	public Report(int reportNo, int userNo, int boardNo, int categoryNo, String categoryName, String title) {
		super();
		this.reportNo = reportNo;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.title = title;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", boardNo=" + boardNo + ", categoryNo="
				+ categoryNo + ", categoryName=" + categoryName + ", title=" + title + "]";
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
