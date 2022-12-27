package hyunkyung.dto;

import java.util.Date;

public class ChallengeFile {

	private int cfileNo;
	private String originfile;
	private String storedfile;
	private int cfilesize;
	private Date regiDate;
	private int chpageNo;
	
	
	public ChallengeFile() {
	}

	public ChallengeFile(int cfileNo, String originfile, String storedfile, int cfilesize, Date regiDate,
			int chpageNo) {
		super();
		this.cfileNo = cfileNo;
		this.originfile = originfile;
		this.storedfile = storedfile;
		this.cfilesize = cfilesize;
		this.regiDate = regiDate;
		this.chpageNo = chpageNo;
	}

	@Override
	public String toString() {
		return "ChallengeFile [cfileNo=" + cfileNo + ", originfile=" + originfile + ", storedfile=" + storedfile
				+ ", cfilesize=" + cfilesize + ", regiDate=" + regiDate + ", chpageNo=" + chpageNo + "]";
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

	public int getChpageNo() {
		return chpageNo;
	}

	public void setChpageNo(int chpageNo) {
		this.chpageNo = chpageNo;
	}
	
	
}
