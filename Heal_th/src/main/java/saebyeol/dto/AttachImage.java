package saebyeol.dto;

public class AttachImage {
	
	private String uploadPath;
	
	private String uuid;
	
	private String fileName;
	
	private int prodNo;

	@Override
	public String toString() {
		return "AttachImage [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", prodNo="
				+ prodNo + "]";
	}

	/**
	 * @return the uploadPath
	 */
	public String getUploadPath() {
		return uploadPath;
	}

	/**
	 * @param uploadPath the uploadPath to set
	 */
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	/**
	 * @return the uuid
	 */
	public String getUuid() {
		return uuid;
	}

	/**
	 * @param uuid the uuid to set
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the prodNo
	 */
	public int getProdNo() {
		return prodNo;
	}

	/**
	 * @param prodNo the prodNo to set
	 */
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	
	

}
