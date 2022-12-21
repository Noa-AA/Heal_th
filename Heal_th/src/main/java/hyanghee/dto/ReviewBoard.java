package hyanghee.dto;

import java.util.Date;

public class ReviewBoard {

	private int reviewNo;
	private Date rInstDate;
	private String rTitle;
	private String gymName;
	private String gymIntroduce;
	private String classification;
	private String price;
	private String address;
	private Double lng;
	private Double lat;
	private Double score;
	private String review;
	private Date rUptDate;
	private Date rDeleteDate;
	private int rHit;
	private int rThumbs;
	private int userNo;
	private int categoryNo;	
	
	public ReviewBoard() {	}

	public ReviewBoard(int reviewNo, Date rInstDate, String rTitle, String gymName, String gymIntroduce,
			String classification, String price, String address, Double lng, Double lat, Double score, String review,
			Date rUptDate, Date rDeleteDate, int rHit, int rThumbs, int userNo, int categoryNo) {
		super();
		this.reviewNo = reviewNo;
		this.rInstDate = rInstDate;
		this.rTitle = rTitle;
		this.gymName = gymName;
		this.gymIntroduce = gymIntroduce;
		this.classification = classification;
		this.price = price;
		this.address = address;
		this.lng = lng;
		this.lat = lat;
		this.score = score;
		this.review = review;
		this.rUptDate = rUptDate;
		this.rDeleteDate = rDeleteDate;
		this.rHit = rHit;
		this.rThumbs = rThumbs;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "ReviewBoard [reviewNo=" + reviewNo + ", rInstDate=" + rInstDate + ", rTitle=" + rTitle + ", gymName="
				+ gymName + ", gymIntroduce=" + gymIntroduce + ", classification=" + classification + ", price=" + price
				+ ", address=" + address + ", lng=" + lng + ", lat=" + lat + ", score=" + score + ", review=" + review
				+ ", rUptDate=" + rUptDate + ", rDeleteDate=" + rDeleteDate + ", rHit=" + rHit + ", rThumbs=" + rThumbs
				+ ", userNo=" + userNo + ", categoryNo=" + categoryNo + "]";
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public Date getrInstDate() {
		return rInstDate;
	}

	public void setrInstDate(Date rInstDate) {
		this.rInstDate = rInstDate;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getGymName() {
		return gymName;
	}

	public void setGymName(String gymName) {
		this.gymName = gymName;
	}

	public String getGymIntroduce() {
		return gymIntroduce;
	}

	public void setGymIntroduce(String gymIntroduce) {
		this.gymIntroduce = gymIntroduce;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getrUptDate() {
		return rUptDate;
	}

	public void setrUptDate(Date rUptDate) {
		this.rUptDate = rUptDate;
	}

	public Date getrDeleteDate() {
		return rDeleteDate;
	}

	public void setrDeleteDate(Date rDeleteDate) {
		this.rDeleteDate = rDeleteDate;
	}

	public int getrHit() {
		return rHit;
	}

	public void setrHit(int rHit) {
		this.rHit = rHit;
	}

	public int getrThumbs() {
		return rThumbs;
	}

	public void setrThumbs(int rThumbs) {
		this.rThumbs = rThumbs;
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
