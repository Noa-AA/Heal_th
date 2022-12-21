package saebyeol.dto;

import java.util.Date;
import java.util.List;

public class Product {
	
	private int prodNo;
	private String pName;
	private int pPrice;
	private String pImage1;
	private String pImage2;
	private String pDetail;
	private Date pDate;
	private int pHit;
	private String pSteaming;
	private String pCart;
	private int pStock;
	private int pDelivery;
	private int pSell;
	private int pCateNo;
	private int userNo;
	private int adminNo;
	
	private List<AttachImage> imageList;
	
	public Product() {}

	
	
	public Product(int prodNo, String pName, int pPrice, String pImage1, String pImage2, String pDetail, Date pDate,
			int pHit, String pSteaming, String pCart, int pStock, int pDelivery, int pSell, int pCateNo, int userNo,
			int adminNo, List<AttachImage> imageList) {
		super();
		this.prodNo = prodNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pImage1 = pImage1;
		this.pImage2 = pImage2;
		this.pDetail = pDetail;
		this.pDate = pDate;
		this.pHit = pHit;
		this.pSteaming = pSteaming;
		this.pCart = pCart;
		this.pStock = pStock;
		this.pDelivery = pDelivery;
		this.pSell = pSell;
		this.pCateNo = pCateNo;
		this.userNo = userNo;
		this.adminNo = adminNo;
		this.imageList = imageList;
	}

	


	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", pName=" + pName + ", pPrice=" + pPrice + ", pImage1=" + pImage1
				+ ", pImage2=" + pImage2 + ", pDetail=" + pDetail + ", pDate=" + pDate + ", pHit=" + pHit
				+ ", pSteaming=" + pSteaming + ", pCart=" + pCart + ", pStock=" + pStock + ", pDelivery=" + pDelivery
				+ ", pSell=" + pSell + ", pCateNo=" + pCateNo + ", userNo=" + userNo + ", adminNo=" + adminNo
				+ ", imageList=" + imageList + "]";
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

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the pPrice
	 */
	public int getpPrice() {
		return pPrice;
	}

	/**
	 * @param pPrice the pPrice to set
	 */
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	/**
	 * @return the pImage1
	 */
	public String getpImage1() {
		return pImage1;
	}

	/**
	 * @param pImage1 the pImage1 to set
	 */
	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}

	/**
	 * @return the pImage2
	 */
	public String getpImage2() {
		return pImage2;
	}

	/**
	 * @param pImage2 the pImage2 to set
	 */
	public void setpImage2(String pImage2) {
		this.pImage2 = pImage2;
	}

	/**
	 * @return the pDetail
	 */
	public String getpDetail() {
		return pDetail;
	}

	/**
	 * @param pDetail the pDetail to set
	 */
	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	/**
	 * @return the pDate
	 */
	public Date getpDate() {
		return pDate;
	}

	/**
	 * @param pDate the pDate to set
	 */
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	/**
	 * @return the pHit
	 */
	public int getpHit() {
		return pHit;
	}

	/**
	 * @param pHit the pHit to set
	 */
	public void setpHit(int pHit) {
		this.pHit = pHit;
	}

	/**
	 * @return the pSteaming
	 */
	public String getpSteaming() {
		return pSteaming;
	}

	/**
	 * @param pSteaming the pSteaming to set
	 */
	public void setpSteaming(String pSteaming) {
		this.pSteaming = pSteaming;
	}

	/**
	 * @return the pCart
	 */
	public String getpCart() {
		return pCart;
	}

	/**
	 * @param pCart the pCart to set
	 */
	public void setpCart(String pCart) {
		this.pCart = pCart;
	}

	/**
	 * @return the pStock
	 */
	public int getpStock() {
		return pStock;
	}

	/**
	 * @param pStock the pStock to set
	 */
	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	/**
	 * @return the pDelivery
	 */
	public int getpDelivery() {
		return pDelivery;
	}

	/**
	 * @param pDelivery the pDelivery to set
	 */
	public void setpDelivery(int pDelivery) {
		this.pDelivery = pDelivery;
	}

	/**
	 * @return the pSell
	 */
	public int getpSell() {
		return pSell;
	}

	/**
	 * @param pSell the pSell to set
	 */
	public void setpSell(int pSell) {
		this.pSell = pSell;
	}

	/**
	 * @return the pCateNo
	 */
	public int getpCateNo() {
		return pCateNo;
	}

	/**
	 * @param pCateNo the pCateNo to set
	 */
	public void setpCateNo(int pCateNo) {
		this.pCateNo = pCateNo;
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

	/**
	 * @return the adminNo
	 */
	public int getAdminNo() {
		return adminNo;
	}

	/**
	 * @param adminNo the adminNo to set
	 */
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}



	/**
	 * @return the imageList
	 */
	public List<AttachImage> getImageList() {
		return imageList;
	}



	/**
	 * @param imageList the imageList to set
	 */
	public void setImageList(List<AttachImage> imageList) {
		this.imageList = imageList;
	}
	
	
	

}
