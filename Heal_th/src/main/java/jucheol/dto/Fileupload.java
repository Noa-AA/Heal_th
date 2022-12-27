package jucheol.dto;

public class Fileupload {
	private int fileNo;
	private String fileOri;
	private String fileSto;
	private String filePath;
	private int userNo;
	private int boardNo;
	private int categoryNo;
	
	public Fileupload() {	}

	public Fileupload(int fileNo, String fileOri, String fileSto, String filePath, int userNo, int boardNo,
			int categoryNo) {
		super();
		this.fileNo = fileNo;
		this.fileOri = fileOri;
		this.fileSto = fileSto;
		this.filePath = filePath;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Fileupload [fileNo=" + fileNo + ", fileOri=" + fileOri + ", fileSto=" + fileSto + ", filePath="
				+ filePath + ", userNo=" + userNo + ", boardNo=" + boardNo + ", categoryNo=" + categoryNo + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileOri() {
		return fileOri;
	}

	public void setFileOri(String fileOri) {
		this.fileOri = fileOri;
	}

	public String getFileSto() {
		return fileSto;
	}

	public void setFileSto(String fileSto) {
		this.fileSto = fileSto;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
