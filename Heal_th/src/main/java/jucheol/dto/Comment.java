package jucheol.dto;

import java.util.Date;

public class Comment {

	private int commentNo;
	private String commentContent;
	private int userNo;
	private Date commentDate;
	private int verifyNo;
	private int rewiewNo;
	private int bfNo;
	private int dietNo;
	private int boardNo;
	private int categoryNo;
	private String userNick;
	private String profileStoreName;
	
	public Comment() {	}

	public Comment(int commentNo, String commentContent, int userNo, Date commentDate, int verifyNo, int rewiewNo,
			int bfNo, int dietNo, int boardNo, int categoryNo, String userNick, String profileStoreName) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.userNo = userNo;
		this.commentDate = commentDate;
		this.verifyNo = verifyNo;
		this.rewiewNo = rewiewNo;
		this.bfNo = bfNo;
		this.dietNo = dietNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
		this.userNick = userNick;
		this.profileStoreName = profileStoreName;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentContent=" + commentContent + ", userNo=" + userNo
				+ ", commentDate=" + commentDate + ", verifyNo=" + verifyNo + ", rewiewNo=" + rewiewNo + ", bfNo="
				+ bfNo + ", dietNo=" + dietNo + ", boardNo=" + boardNo + ", categoryNo=" + categoryNo + ", userNick="
				+ userNick + ", profileStoreName=" + profileStoreName + "]";
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getVerifyNo() {
		return verifyNo;
	}

	public void setVerifyNo(int verifyNo) {
		this.verifyNo = verifyNo;
	}

	public int getRewiewNo() {
		return rewiewNo;
	}

	public void setRewiewNo(int rewiewNo) {
		this.rewiewNo = rewiewNo;
	}

	public int getBfNo() {
		return bfNo;
	}

	public void setBfNo(int bfNo) {
		this.bfNo = bfNo;
	}

	public int getDietNo() {
		return dietNo;
	}

	public void setDietNo(int dietNo) {
		this.dietNo = dietNo;
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

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getProfileStoreName() {
		return profileStoreName;
	}

	public void setProfileStoreName(String profileStoreName) {
		this.profileStoreName = profileStoreName;
	}

	
}
