package unhak.dto;

import java.util.Date;

public class CartDto {

	private int cartNo;
	private int userNo;
	private int prodNo;
	private int cartStock;
	private Date addDate; 
	private String pName;
	private int pPrice;
	private String pImage1;
	
	public CartDto() {	}

	@Override
	public String toString() {
		return "CartDto [cartNo=" + cartNo + ", userNo=" + userNo + ", prodNo=" + prodNo + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + ", pName=" + pName + ", pPrice=" + pPrice + ", pImage1=" + pImage1 + "]";
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
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

	public CartDto(int cartNo, int userNo, int prodNo, int cartStock, Date addDate, String pName, int pPrice,
			String pImage1) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.prodNo = prodNo;
		this.cartStock = cartStock;
		this.addDate = addDate;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pImage1 = pImage1;
	}

	
	
	
}
