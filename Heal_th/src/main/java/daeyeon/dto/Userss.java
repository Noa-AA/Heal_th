package daeyeon.dto;

public class Userss {
	private int userNo;
	
	public Userss() {
		// TODO Auto-generated constructor stub
	}

	public Userss(int userNo) {
		super();
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Users [userNo=" + userNo + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
	
}
