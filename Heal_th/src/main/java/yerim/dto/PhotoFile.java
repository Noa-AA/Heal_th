package yerim.dto;

public class PhotoFile {

	private int fileNo;
	private String originName;
	private String storedName;
	private int userNo;
	
	public PhotoFile() {}

	public PhotoFile(int fileNo, String originName, String storedName, int userNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.storedName = storedName;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "PhotoFile [fileNo=" + fileNo + ", originName=" + originName + ", storedName=" + storedName + ", userNo="
				+ userNo + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	


}
