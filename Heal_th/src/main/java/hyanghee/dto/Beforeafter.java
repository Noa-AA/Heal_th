package hyanghee.dto;

import java.util.Date;

public class Beforeafter {

	private int bfNo;
	private Date bfInstDate;
	private String bfTitle;
	private int height;
	private String gender;
	private int weight;
	private String bfExercise;
	private String gWeight;
	private String sDate;
	private String eDate;
	private String seleExercise;
	private String beforeCon;
	private String cWeight;
	private String gResult;
	private String afterCon;
	private Date bfUptDate;
	private Date bfDeleteDate;
	private int bfHit;
	private int bfThumbs;
	private int userNo;
	private int categoryNo;
	
	public Beforeafter() {	}

	public Beforeafter(int bfNo, Date bfInstDate, String bfTitle, int height, String gender, int weight,
			String bfExercise, String gWeight, String sDate, String eDate, String seleExercise, String beforeCon,
			String cWeight, String gResult, String afterCon, Date bfUptDate, Date bfDeleteDate, int bfHit, int bfThumbs,
			int userNo, int categoryNo) {
		super();
		this.bfNo = bfNo;
		this.bfInstDate = bfInstDate;
		this.bfTitle = bfTitle;
		this.height = height;
		this.gender = gender;
		this.weight = weight;
		this.bfExercise = bfExercise;
		this.gWeight = gWeight;
		this.sDate = sDate;
		this.eDate = eDate;
		this.seleExercise = seleExercise;
		this.beforeCon = beforeCon;
		this.cWeight = cWeight;
		this.gResult = gResult;
		this.afterCon = afterCon;
		this.bfUptDate = bfUptDate;
		this.bfDeleteDate = bfDeleteDate;
		this.bfHit = bfHit;
		this.bfThumbs = bfThumbs;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Beforeafter [bfNo=" + bfNo + ", bfInstDate=" + bfInstDate + ", bfTitle=" + bfTitle + ", height="
				+ height + ", gender=" + gender + ", weight=" + weight + ", bfExercise=" + bfExercise + ", gWeight="
				+ gWeight + ", sDate=" + sDate + ", eDate=" + eDate + ", seleExercise=" + seleExercise + ", beforeCon="
				+ beforeCon + ", cWeight=" + cWeight + ", gResult=" + gResult + ", afterCon=" + afterCon
				+ ", bfUptDate=" + bfUptDate + ", bfDeleteDate=" + bfDeleteDate + ", bfHit=" + bfHit + ", bfThumbs="
				+ bfThumbs + ", userNo=" + userNo + ", categoryNo=" + categoryNo + "]";
	}

	public int getBfNo() {
		return bfNo;
	}

	public void setBfNo(int bfNo) {
		this.bfNo = bfNo;
	}

	public Date getBfInstDate() {
		return bfInstDate;
	}

	public void setBfInstDate(Date bfInstDate) {
		this.bfInstDate = bfInstDate;
	}

	public String getBfTitle() {
		return bfTitle;
	}

	public void setBfTitle(String bfTitle) {
		this.bfTitle = bfTitle;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getBfExercise() {
		return bfExercise;
	}

	public void setBfExercise(String bfExercise) {
		this.bfExercise = bfExercise;
	}

	public String getgWeight() {
		return gWeight;
	}

	public void setgWeight(String gWeight) {
		this.gWeight = gWeight;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String getSeleExercise() {
		return seleExercise;
	}

	public void setSeleExercise(String seleExercise) {
		this.seleExercise = seleExercise;
	}

	public String getBeforeCon() {
		return beforeCon;
	}

	public void setBeforeCon(String beforeCon) {
		this.beforeCon = beforeCon;
	}

	public String getcWeight() {
		return cWeight;
	}

	public void setcWeight(String cWeight) {
		this.cWeight = cWeight;
	}

	public String getgResult() {
		return gResult;
	}

	public void setgResult(String gResult) {
		this.gResult = gResult;
	}

	public String getAfterCon() {
		return afterCon;
	}

	public void setAfterCon(String afterCon) {
		this.afterCon = afterCon;
	}

	public Date getBfUptDate() {
		return bfUptDate;
	}

	public void setBfUptDate(Date bfUptDate) {
		this.bfUptDate = bfUptDate;
	}

	public Date getBfDeleteDate() {
		return bfDeleteDate;
	}

	public void setBfDeleteDate(Date bfDeleteDate) {
		this.bfDeleteDate = bfDeleteDate;
	}

	public int getBfHit() {
		return bfHit;
	}

	public void setBfHit(int bfHit) {
		this.bfHit = bfHit;
	}

	public int getBfThumbs() {
		return bfThumbs;
	}

	public void setBfThumbs(int bfThumbs) {
		this.bfThumbs = bfThumbs;
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
