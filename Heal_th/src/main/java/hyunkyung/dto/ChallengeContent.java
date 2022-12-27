package hyunkyung.dto;

import java.util.Date;

public class ChallengeContent {

	private int chpageNo;
	private String chTitle;
	private Date chDate;
	private String chWriter;
	private String chContent;
	private int challengeNo;
	private int cfileNo;
	private String originfile;
	private String storedfile;
	private int cfilesize;
	private Date regiDate;
	
	public ChallengeContent() {
	}

	public ChallengeContent(int chpageNo, String chTitle, Date chDate, String chWriter, String chContent,
			int challengeNo, int cfileNo, String originfile, String storedfile, int cfilesize, Date regiDate) {
		super();
		this.chpageNo = chpageNo;
		this.chTitle = chTitle;
		this.chDate = chDate;
		this.chWriter = chWriter;
		this.chContent = chContent;
		this.challengeNo = challengeNo;
		this.cfileNo = cfileNo;
		this.originfile = originfile;
		this.storedfile = storedfile;
		this.cfilesize = cfilesize;
		this.regiDate = regiDate;
	}

	@Override
	public String toString() {
		return "ChallengeContent [chpageNo=" + chpageNo + ", chTitle=" + chTitle + ", chDate=" + chDate + ", chWriter="
				+ chWriter + ", chContent=" + chContent + ", challengeNo=" + challengeNo + ", cfileNo=" + cfileNo
				+ ", originfile=" + originfile + ", storedfile=" + storedfile + ", cfilesize=" + cfilesize
				+ ", regiDate=" + regiDate + "]";
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

	public int getCfileNo() {
		return cfileNo;
	}

	public void setCfileNo(int cfileNo) {
		this.cfileNo = cfileNo;
	}

	public String getOriginfile() {
		return originfile;
	}

	public void setOriginfile(String originfile) {
		this.originfile = originfile;
	}

	public String getStoredfile() {
		return storedfile;
	}

	public void setStoredfile(String storedfile) {
		this.storedfile = storedfile;
	}

	public int getCfilesize() {
		return cfilesize;
	}

	public void setCfilesize(int cfilesize) {
		this.cfilesize = cfilesize;
	}

	public Date getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	
	
}
