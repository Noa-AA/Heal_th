package jucheol.dto;

public class Report {

	private int reportNo;
	private int boardNo;
	private int categoryNo;
	private String categoryName; 
	private String title;
	private int wuserNo; //글작성자
	private String wuserNick;
	private int ruserNo; //신고자
	private String ruserNick;
	
	
	public Report() {	}


	public Report(int reportNo, int boardNo, int categoryNo, String categoryName, String title, int wuserNo,
			String wuserNick, int ruserNo, String ruserNick) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.title = title;
		this.wuserNo = wuserNo;
		this.wuserNick = wuserNick;
		this.ruserNo = ruserNo;
		this.ruserNick = ruserNick;
	}


	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", categoryNo=" + categoryNo
				+ ", categoryName=" + categoryName + ", title=" + title + ", wuserNo=" + wuserNo + ", wuserNick="
				+ wuserNick + ", ruserNo=" + ruserNo + ", ruserNick=" + ruserNick + "]";
	}


	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
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


	public int getWuserNo() {
		return wuserNo;
	}


	public void setWuserNo(int wuserNo) {
		this.wuserNo = wuserNo;
	}


	public String getWuserNick() {
		return wuserNick;
	}


	public void setWuserNick(String wuserNick) {
		this.wuserNick = wuserNick;
	}


	public int getRuserNo() {
		return ruserNo;
	}


	public void setRuserNo(int ruserNo) {
		this.ruserNo = ruserNo;
	}


	public String getRuserNick() {
		return ruserNick;
	}


	public void setRuserNick(String ruserNick) {
		this.ruserNick = ruserNick;
	}

	
}
