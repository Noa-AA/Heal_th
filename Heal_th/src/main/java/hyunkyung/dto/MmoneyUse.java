package hyunkyung.dto;

public class MmoneyUse {

	private int mNo; //머니 번호
	private int mUse; //사용금액
	private int mCharge; //충전금액
	private String mDetails; //사용내역
	private int userNo;
	
	public MmoneyUse() {
	}

	public MmoneyUse(int mNo, int mUse, int mCharge, String mDetails, int userNo) {
		super();
		this.mNo = mNo;
		this.mUse = mUse;
		this.mCharge = mCharge;
		this.mDetails = mDetails;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "MmoneyUse [mNo=" + mNo + ", mUse=" + mUse + ", mCharge=" + mCharge + ", mDetails=" + mDetails
				+ ", userNo=" + userNo + "]";
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getmUse() {
		return mUse;
	}

	public void setmUse(int mUse) {
		this.mUse = mUse;
	}

	public int getmCharge() {
		return mCharge;
	}

	public void setmCharge(int mCharge) {
		this.mCharge = mCharge;
	}

	public String getmDetails() {
		return mDetails;
	}

	public void setmDetails(String mDetails) {
		this.mDetails = mDetails;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
}
