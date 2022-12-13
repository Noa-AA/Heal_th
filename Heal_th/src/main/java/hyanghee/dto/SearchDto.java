package hyanghee.dto;

public class SearchDto {
	
	private String bfTitle;
	private String dTitle;
	private String vTitle;
	private String rTitle;
	private int bfNo;
	private int verifyNo;
	private int reviewNo;
	private int dietNo;
	private int vHit;
	private int bfHit;
	private int rHit;
	private int dHit;
	private int userNo;
	private String userNick;
	private int categoryNo;
	
	private String type;
	private String keyword;
	
	public SearchDto() {	}

	public SearchDto(String bfTitle, String dTitle, String vTitle, String rTitle, int bfNo, int verifyNo, int reviewNo,
			int dietNo, int vHit, int bfHit, int rHit, int dHit, int userNo, String userNick, int categoryNo,
			String type, String keyword) {
		super();
		this.bfTitle = bfTitle;
		this.dTitle = dTitle;
		this.vTitle = vTitle;
		this.rTitle = rTitle;
		this.bfNo = bfNo;
		this.verifyNo = verifyNo;
		this.reviewNo = reviewNo;
		this.dietNo = dietNo;
		this.vHit = vHit;
		this.bfHit = bfHit;
		this.rHit = rHit;
		this.dHit = dHit;
		this.userNo = userNo;
		this.userNick = userNick;
		this.categoryNo = categoryNo;
		this.type = type;
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchDto [bfTitle=" + bfTitle + ", dTitle=" + dTitle + ", vTitle=" + vTitle + ", rTitle=" + rTitle
				+ ", bfNo=" + bfNo + ", verifyNo=" + verifyNo + ", reviewNo=" + reviewNo + ", dietNo=" + dietNo
				+ ", vHit=" + vHit + ", bfHit=" + bfHit + ", rHit=" + rHit + ", dHit=" + dHit + ", userNo=" + userNo
				+ ", userNick=" + userNick + ", categoryNo=" + categoryNo + ", type=" + type + ", keyword=" + keyword
				+ "]";
	}

	public String getBfTitle() {
		return bfTitle;
	}

	public void setBfTitle(String bfTitle) {
		this.bfTitle = bfTitle;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public String getvTitle() {
		return vTitle;
	}

	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public int getBfNo() {
		return bfNo;
	}

	public void setBfNo(int bfNo) {
		this.bfNo = bfNo;
	}

	public int getVerifyNo() {
		return verifyNo;
	}

	public void setVerifyNo(int verifyNo) {
		this.verifyNo = verifyNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getDietNo() {
		return dietNo;
	}

	public void setDietNo(int dietNo) {
		this.dietNo = dietNo;
	}

	public int getvHit() {
		return vHit;
	}

	public void setvHit(int vHit) {
		this.vHit = vHit;
	}

	public int getBfHit() {
		return bfHit;
	}

	public void setBfHit(int bfHit) {
		this.bfHit = bfHit;
	}

	public int getrHit() {
		return rHit;
	}

	public void setrHit(int rHit) {
		this.rHit = rHit;
	}

	public int getdHit() {
		return dHit;
	}

	public void setdHit(int dHit) {
		this.dHit = dHit;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
		
	
	
}
