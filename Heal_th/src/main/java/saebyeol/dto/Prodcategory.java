package saebyeol.dto;

public class Prodcategory {
	
	private String pCateNo;
	private String pCateName;
	
	public Prodcategory() {}

	public Prodcategory(String pCateNo, String pCateName) {
		super();
		this.pCateNo = pCateNo;
		this.pCateName = pCateName;
	}

	@Override
	public String toString() {
		return "Prodcategory [pCateNo=" + pCateNo + ", pCateName=" + pCateName + "]";
	}

	/**
	 * @return the pCateNo
	 */
	public String getpCateNo() {
		return pCateNo;
	}

	/**
	 * @param pCateNo the pCateNo to set
	 */
	public void setpCateNo(String pCateNo) {
		this.pCateNo = pCateNo;
		if(pCateNo.equals("10")) {
			this.pCateName = "운동용품";
		} else if(pCateNo.equals("20")){
			this.pCateName = "보조제";
		} else {
			this.pCateName = "다이어트음식";
		}
	}

	/**
	 * @return the pCateName
	 */
	public String getpCateName() {
		return pCateName;
	}

	/**
	 * @param pCateName the pCateName to set
	 */
	public void setpCateName(String pCateName) {
		this.pCateName = pCateName;
	}
	
	

}
