package unhak.dto;

import java.util.Date;

public class StoreDto {

	
	
	private int prodNo;
	private int userNo;
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
	
	
	public StoreDto() {	}
	
	
	
	
	
	public StoreDto(int prodNo, int userNo, String pName, int pPrice, String pImage1, String pImage2, String pDetail,
			Date pDate, int pHit, String pSteaming, String pCart, int pStock, int pDelivery, int pSell) {
		super();
		this.prodNo = prodNo;
		this.userNo = userNo;
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
	}





	@Override
	public String toString() {
		return "StoreDto [prodNo=" + prodNo + ", userNo=" + userNo + ", pName=" + pName + ", pPrice=" + pPrice
				+ ", pImage1=" + pImage1 + ", pImage2=" + pImage2 + ", pDetail=" + pDetail + ", pDate=" + pDate
				+ ", pHit=" + pHit + ", pSteaming=" + pSteaming + ", pCart=" + pCart + ", pStock=" + pStock
				+ ", pDelivery=" + pDelivery + ", pSell=" + pSell + "]";
	}





	public int getProdNo() {
		return prodNo;
	}





	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}





	public int getUserNo() {
		return userNo;
	}





	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}





	public String getpName() {
		return pName;
	}





	public void setpName(String pName) {
		this.pName = pName;
	}





	public int getpPrice() {
		return pPrice;
	}





	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}





	public String getpImage1() {
		return pImage1;
	}





	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}





	public String getpImage2() {
		return pImage2;
	}





	public void setpImage2(String pImage2) {
		this.pImage2 = pImage2;
	}





	public String getpDetail() {
		return pDetail;
	}





	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}





	public Date getpDate() {
		return pDate;
	}





	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}





	public int getpHit() {
		return pHit;
	}





	public void setpHit(int pHit) {
		this.pHit = pHit;
	}





	public String getpSteaming() {
		return pSteaming;
	}





	public void setpSteaming(String pSteaming) {
		this.pSteaming = pSteaming;
	}





	public String getpCart() {
		return pCart;
	}





	public void setpCart(String pCart) {
		this.pCart = pCart;
	}





	public int getpStock() {
		return pStock;
	}





	public void setpStock(int pStock) {
		this.pStock = pStock;
	}





	public int getpDelivery() {
		return pDelivery;
	}





	public void setpDelivery(int pDelivery) {
		this.pDelivery = pDelivery;
	}





	public int getpSell() {
		return pSell;
	}





	public void setpSell(int pSell) {
		this.pSell = pSell;
	}
	
	
}
