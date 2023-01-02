package unhak.dto;

public class PaymentDto {


	/*결제 번호*/
	private int payNo;
	/* 주문 번호 */
	private String orderNo;
	/*결제 수단*/
	private String paymentMethod;
	/*카드사*/
	private String userCardcom;
	/*결제 금액*/
	private int paymentAmount;
	/* 결제 날짜 */
	private String paymentDate;
	/* 배송지 */
	private String address;	
	/*휴대폰번호*/
	private int phoneNo;
	/* 주문 회원 번호 */
	private int userNo;
	/*상품명*/
	private String pName;
	/*상품메인사진*/
	private String pImage1;
	
	private int rnum;
	
	public PaymentDto() {}

	public PaymentDto(int payNo, String orderNo, String paymentMethod, String userCardcom, int paymentAmount,
			String paymentDate, String address, int phoneNo, int userNo, String pName, String pImage1, int rnum) {
		super();
		this.payNo = payNo;
		this.orderNo = orderNo;
		this.paymentMethod = paymentMethod;
		this.userCardcom = userCardcom;
		this.paymentAmount = paymentAmount;
		this.paymentDate = paymentDate;
		this.address = address;
		this.phoneNo = phoneNo;
		this.userNo = userNo;
		this.pName = pName;
		this.pImage1 = pImage1;
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "PaymentDto [payNo=" + payNo + ", orderNo=" + orderNo + ", paymentMethod=" + paymentMethod
				+ ", userCardcom=" + userCardcom + ", paymentAmount=" + paymentAmount + ", paymentDate=" + paymentDate
				+ ", address=" + address + ", phoneNo=" + phoneNo + ", userNo=" + userNo + ", pName=" + pName
				+ ", pImage1=" + pImage1 + ", rnum=" + rnum + "]";
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getUserCardcom() {
		return userCardcom;
	}

	public void setUserCardcom(String userCardcom) {
		this.userCardcom = userCardcom;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(int phoneNo) {
		this.phoneNo = phoneNo;
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

	public String getpImage1() {
		return pImage1;
	}

	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	
	
	
}
