package yerim.dto;

public class Naver {
	
	private int naverNo;
	private int userNo;
	private String naverId;
	private String naverPw;
	
	public Naver() {}

	public Naver(int naverNo, int userNo, String naverId, String naverPw) {
		super();
		this.naverNo = naverNo;
		this.userNo = userNo;
		this.naverId = naverId;
		this.naverPw = naverPw;
	}

	@Override
	public String toString() {
		return "Naver [naverNo=" + naverNo + ", userNo=" + userNo + ", naverId=" + naverId + ", naverPw=" + naverPw
				+ "]";
	}

	public int getNaverNo() {
		return naverNo;
	}

	public void setNaverNo(int naverNo) {
		this.naverNo = naverNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNaverId() {
		return naverId;
	}

	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}

	public String getNaverPw() {
		return naverPw;
	}

	public void setNaverPw(String naverPw) {
		this.naverPw = naverPw;
	}

	
}
