package jucheol.dto;

public class Scrap {

	private int scrapNo;
	private int userNo;
	private int boardNo;
	private int categoryNo;
	
	public Scrap() {	}

	public Scrap(int scrapNo, int userNo, int boardNo, int categoryNo) {
		super();
		this.scrapNo = scrapNo;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Scrap [scrapNo=" + scrapNo + ", userNo=" + userNo + ", boardNo=" + boardNo + ", categoryNo="
				+ categoryNo + "]";
	}

	public int getScrapNo() {
		return scrapNo;
	}

	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
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
	
	
}
