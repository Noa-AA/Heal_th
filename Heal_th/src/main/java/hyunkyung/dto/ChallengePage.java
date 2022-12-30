package hyunkyung.dto;

import java.util.Date;

public class ChallengePage {
	
	private int chpageNo;
	private String chTitle;
	private Date chDate;
	private String chWriter;
	private String chContent;
	private int challengeNo;
	
	public ChallengePage() {
	}

	public ChallengePage(int chpageNo, String chTitle, Date chDate, String chWriter, String chContent,
			int challengeNo) {
		super();
		this.chpageNo = chpageNo;
		this.chTitle = chTitle;
		this.chDate = chDate;
		this.chWriter = chWriter;
		this.chContent = chContent;
		this.challengeNo = challengeNo;
	}

	@Override
	public String toString() {
		return "ChallengePage [chpageNo=" + chpageNo + ", chTitle=" + chTitle + ", chDate=" + chDate + ", chWriter="
				+ chWriter + ", chContent=" + chContent + ", challengeNo=" + challengeNo + "]";
	}

	public int getChpageNo() {
		return chpageNo;
	}

	public void setChpageNo(int chpageNo) {
		this.chpageNo = chpageNo;
	}

	public String getChTitle() {
		return chTitle;
	}

	public void setChTitle(String chTitle) {
		this.chTitle = chTitle;
	}

	public Date getChDate() {
		return chDate;
	}

	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}

	public String getChWriter() {
		return chWriter;
	}

	public void setChWriter(String chWriter) {
		this.chWriter = chWriter;
	}

	public String getChContent() {
		return chContent;
	}

	public void setChContent(String chContent) {
		this.chContent = chContent;
	}

	public int getChallengeNo() {
		return challengeNo;
	}

	public void setChallengeNo(int challengeNo) {
		this.challengeNo = challengeNo;
	}
	
	
}
