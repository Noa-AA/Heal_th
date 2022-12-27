package hyanghee.dto;

import java.util.Date;

public class VerifyBoard {
	
	private int verifyNo;
	private String vTitle;
	private String exercise;
	private String time;
	private int kcal;
	private String verifyContent;
	private int vHit;
	private Date vInstDate;
	private int vThumbs;
	private int userNo;
	private int categoryNo;
	
	public VerifyBoard() {	}

	public VerifyBoard(int verifyNo, String vTitle, String exercise, String time, int kcal, String verifyContent,
			int vHit, Date vInstDate, int vThumbs, int userNo, int categoryNo) {
		super();
		this.verifyNo = verifyNo;
		this.vTitle = vTitle;
		this.exercise = exercise;
		this.time = time;
		this.kcal = kcal;
		this.verifyContent = verifyContent;
		this.vHit = vHit;
		this.vInstDate = vInstDate;
		this.vThumbs = vThumbs;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "VerifyBoard [verifyNo=" + verifyNo + ", vTitle=" + vTitle + ", exercise=" + exercise + ", time=" + time
				+ ", kcal=" + kcal + ", verifyContent=" + verifyContent + ", vHit=" + vHit + ", vInstDate=" + vInstDate
				+ ", vThumbs=" + vThumbs + ", userNo=" + userNo + ", categoryNo=" + categoryNo + "]";
	}

	public int getVerifyNo() {
		return verifyNo;
	}

	public void setVerifyNo(int verifyNo) {
		this.verifyNo = verifyNo;
	}

	public String getvTitle() {
		return vTitle;
	}

	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}

	public String getExercise() {
		return exercise;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public String getVerifyContent() {
		return verifyContent;
	}

	public void setVerifyContent(String verifyContent) {
		this.verifyContent = verifyContent;
	}

	public int getvHit() {
		return vHit;
	}

	public void setvHit(int vHit) {
		this.vHit = vHit;
	}

	public Date getvInstDate() {
		return vInstDate;
	}

	public void setvInstDate(Date vInstDate) {
		this.vInstDate = vInstDate;
	}

	public int getvThumbs() {
		return vThumbs;
	}

	public void setvThumbs(int vThumbs) {
		this.vThumbs = vThumbs;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	
	
	
}
