package changmin.dto;

public class Dgmachat {

	private int dgmachatNo;
	private String dgmachatCon;
	private String userNick;
	
	public Dgmachat() {}

	public Dgmachat(int dgmachatNo, String dgmachatCon, String userNick) {
		super();
		this.dgmachatNo = dgmachatNo;
		this.dgmachatCon = dgmachatCon;
		this.userNick = userNick;
	}

	@Override
	public String toString() {
		return "Dgmachat [dgmachatNo=" + dgmachatNo + ", dgmachatCon=" + dgmachatCon + ", userNick=" + userNick + "]";
	}

	public int getDgmachatNo() {
		return dgmachatNo;
	}

	public void setDgmachatNo(int dgmachatNo) {
		this.dgmachatNo = dgmachatNo;
	}

	public String getDgmachatCon() {
		return dgmachatCon;
	}

	public void setDgmachatCon(String dgmachatCon) {
		this.dgmachatCon = dgmachatCon;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	
	
}
