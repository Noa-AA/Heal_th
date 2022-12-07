package saebyeol.dto;

import java.util.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeTtl;
	private Date noticeDate;
	private int noticeHit;
	private String noticeContent;
	private String noticeFile;
	private int userNo;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTtl, Date noticeDate, int noticeHit, String noticeContent,
			String noticeFile, int userNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTtl = noticeTtl;
		this.noticeDate = noticeDate;
		this.noticeHit = noticeHit;
		this.noticeContent = noticeContent;
		this.noticeFile = noticeFile;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTtl=" + noticeTtl + ", noticeDate=" + noticeDate
				+ ", noticeHit=" + noticeHit + ", noticeContent=" + noticeContent + ", noticeFile=" + noticeFile
				+ ", userNo=" + userNo + "]";
	}

	/**
	 * @return the noticeNo
	 */
	public int getNoticeNo() {
		return noticeNo;
	}

	/**
	 * @param noticeNo the noticeNo to set
	 */
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	/**
	 * @return the noticeTtl
	 */
	public String getNoticeTtl() {
		return noticeTtl;
	}

	/**
	 * @param noticeTtl the noticeTtl to set
	 */
	public void setNoticeTtl(String noticeTtl) {
		this.noticeTtl = noticeTtl;
	}

	/**
	 * @return the noticeDate
	 */
	public Date getNoticeDate() {
		return noticeDate;
	}

	/**
	 * @param noticeDate the noticeDate to set
	 */
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	/**
	 * @return the noticeHit
	 */
	public int getNoticeHit() {
		return noticeHit;
	}

	/**
	 * @param noticeHit the noticeHit to set
	 */
	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}

	/**
	 * @return the noticeContent
	 */
	public String getNoticeContent() {
		return noticeContent;
	}

	/**
	 * @param noticeContent the noticeContent to set
	 */
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	/**
	 * @return the noticeFile
	 */
	public String getNoticeFile() {
		return noticeFile;
	}

	/**
	 * @param noticeFile the noticeFile to set
	 */
	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}

	/**
	 * @return the userNo
	 */
	public int getUserNo() {
		return userNo;
	}

	/**
	 * @param userNo the userNo to set
	 */
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
	
	

}
