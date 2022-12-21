package jucheol.dto;

public class Good {
	
	private int goodNo;
	private int boardNo;
	private int userNo;
	private int  categoryNo;
	
	public Good() {	}

	public Good(int goodNo, int boardNo, int userNo, int categoryNo) {
		super();
		this.goodNo = goodNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Good [goodNo=" + goodNo + ", boardNo=" + boardNo + ", userNo=" + userNo + ", categoryNo=" + categoryNo
				+ "]";
	}

	public int getGoodNo() {
		return goodNo;
	}

	public void setGoodNo(int goodNo) {
		this.goodNo = goodNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
