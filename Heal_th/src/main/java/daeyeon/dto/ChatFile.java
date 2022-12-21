package daeyeon.dto;

public class ChatFile {
	
	private int fileNo;
	private int chatNo;
	private int userNo;
	private String originName;
	private String storedName;
	private String uploadDate;
	
	public ChatFile() {	}

	public ChatFile(int fileNo, int chatNo, int userNo, String originName, String storedName, String uploadDate) {
		super();
		this.fileNo = fileNo;
		this.chatNo = chatNo;
		this.userNo = userNo;
		this.originName = originName;
		this.storedName = storedName;
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "ChatFile [fileNo=" + fileNo + ", chatNo=" + chatNo + ", userNo=" + userNo + ", originName=" + originName
				+ ", storedName=" + storedName + ", uploadDate=" + uploadDate + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	
	
}
