package hyanghee.dto;

import java.util.Date;

public class DietBoard {

	private int dietNo;
	private Date dInstDate;
	private String dTitle;
	private String prodClassification;
	private String dContent;
	private Date dUptDate;
	private Date dDeleteDate;
	private int dHit;
	private int dThumbs;
	private int userNo;
	private int categoryNo;
	
	public DietBoard() {	}

	public DietBoard(int dietNo, Date dInstDate, String dTitle, String prodClassification, String dContent,
			Date dUptDate, Date dDeleteDate, int dHit, int dThumbs, int userNo, int categoryNo) {
		super();
		this.dietNo = dietNo;
		this.dInstDate = dInstDate;
		this.dTitle = dTitle;
		this.prodClassification = prodClassification;
		this.dContent = dContent;
		this.dUptDate = dUptDate;
		this.dDeleteDate = dDeleteDate;
		this.dHit = dHit;
		this.dThumbs = dThumbs;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "DietBoard [dietNo=" + dietNo + ", dInstDate=" + dInstDate + ", dTitle=" + dTitle
				+ ", prodClassification=" + prodClassification + ", dContent=" + dContent + ", dUptDate=" + dUptDate
				+ ", dDeleteDate=" + dDeleteDate + ", dHit=" + dHit + ", dThumbs=" + dThumbs + ", userNo=" + userNo
				+ ", categoryNo=" + categoryNo + "]";
	}

	public int getDietNo() {
		return dietNo;
	}

	public void setDietNo(int dietNo) {
		this.dietNo = dietNo;
	}

	public Date getdInstDate() {
		return dInstDate;
	}

	public void setdInstDate(Date dInstDate) {
		this.dInstDate = dInstDate;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public String getProdClassification() {
		return prodClassification;
	}

	public void setProdClassification(String prodClassification) {
		this.prodClassification = prodClassification;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	public Date getdUptDate() {
		return dUptDate;
	}

	public void setdUptDate(Date dUptDate) {
		this.dUptDate = dUptDate;
	}

	public Date getdDeleteDate() {
		return dDeleteDate;
	}

	public void setdDeleteDate(Date dDeleteDate) {
		this.dDeleteDate = dDeleteDate;
	}

	public int getdHit() {
		return dHit;
	}

	public void setdHit(int dHit) {
		this.dHit = dHit;
	}

	public int getdThumbs() {
		return dThumbs;
	}

	public void setdThumbs(int dThumbs) {
		this.dThumbs = dThumbs;
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
