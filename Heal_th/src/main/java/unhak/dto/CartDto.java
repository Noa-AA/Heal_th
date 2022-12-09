package unhak.dto;

import java.util.Date;

public class CartDto {

//    cart_no     number          not null,
//    user_no      number    not null,
//    prod_no      number          not null,
//    cart_stock   number          not null,
//    add_date     date            default sysdate,
	
	private int cartNo;
	private int userNo;
	private int prodNo;
	private int cartStock;
	private Date addDate;
	
	public CartDto() {	}

	public CartDto(int cartNo, int userNo, int prodNo, int cartStock, Date addDate) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.prodNo = prodNo;
		this.cartStock = cartStock;
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "CartDto [cartNo=" + cartNo + ", userNo=" + userNo + ", prodNo=" + prodNo + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + "]";
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
	
	
	
}
