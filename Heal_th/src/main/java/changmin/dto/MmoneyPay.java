package changmin.dto;

public class MmoneyPay {

	private int mmoneypayNo;
	private String payMethod;
	private String merchant_uid;
	private String prodName;
	private int amount;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;
	private String payDate;
	private int userNo; 
	
	public MmoneyPay() {}

	@Override
	public String toString() {
		return "MmoneyPay [mmoneypayNo=" + mmoneypayNo + ", payMethod=" + payMethod + ", merchant_uid=" + merchant_uid
				+ ", prodName=" + prodName + ", amount=" + amount + ", buyerEmail=" + buyerEmail + ", buyerName="
				+ buyerName + ", buyerTel=" + buyerTel + ", payDate=" + payDate + ", userNo=" + userNo + "]";
	}

	public MmoneyPay(int mmoneypayNo, String payMethod, String merchant_uid, String prodName, int amount,
			String buyerEmail, String buyerName, String buyerTel, String payDate, int userNo) {
		super();
		this.mmoneypayNo = mmoneypayNo;
		this.payMethod = payMethod;
		this.merchant_uid = merchant_uid;
		this.prodName = prodName;
		this.amount = amount;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.payDate = payDate;
		this.userNo = userNo;
	}

	public int getMmoneypayNo() {
		return mmoneypayNo;
	}

	public void setMmoneypayNo(int mmoneypayNo) {
		this.mmoneypayNo = mmoneypayNo;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerTel() {
		return buyerTel;
	}

	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
}
