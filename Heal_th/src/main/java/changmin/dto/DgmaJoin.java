package changmin.dto;

public class DgmaJoin {

	private int dgmaNo;
	private int dgmaExp;
	private String userNick;
	private int userNo;
	
	public DgmaJoin() {}

	public DgmaJoin(int dgmaNo, int dgmaExp, String userNick, int userNo) {
		super();
		this.dgmaNo = dgmaNo;
		this.dgmaExp = dgmaExp;
		this.userNick = userNick;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "DmgaJoin [dgmaNo=" + dgmaNo + ", dgmaExp=" + dgmaExp + ", userNick=" + userNick + ", userNo=" + userNo
				+ "]";
	}

	public int getDgmaNo() {
		return dgmaNo;
	}

	public void setDgmaNo(int dgmaNo) {
		this.dgmaNo = dgmaNo;
	}

	public int getDgmaExp() {
		return dgmaExp;
	}

	public void setDgmaExp(int dgmaExp) {
		this.dgmaExp = dgmaExp;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
