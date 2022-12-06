package changmin.dto;

public class Dgmagotchi {

	private int dgmaNo;
	private String dgmaStatA;
	private String dgmaStatB;
	private String dgmaStatC;
	private String dgmaStatD;
	private int dgmaExp;
	private int userNo;
	
	public Dgmagotchi() {}

	@Override
	public String toString() {
		return "Dgmagotchi [dgmaNo=" + dgmaNo + ", dgmaStatA=" + dgmaStatA + ", dgmaStatB=" + dgmaStatB + ", dgmaStatC="
				+ dgmaStatC + ", dgmaStatD=" + dgmaStatD + ", dgmaExp=" + dgmaExp + ", userNo=" + userNo + "]";
	}

	public Dgmagotchi(int dgmaNo, String dgmaStatA, String dgmaStatB, String dgmaStatC, String dgmaStatD, int dgmaExp,
			int userNo) {
		super();
		this.dgmaNo = dgmaNo;
		this.dgmaStatA = dgmaStatA;
		this.dgmaStatB = dgmaStatB;
		this.dgmaStatC = dgmaStatC;
		this.dgmaStatD = dgmaStatD;
		this.dgmaExp = dgmaExp;
		this.userNo = userNo;
	}

	public int getDgmaNo() {
		return dgmaNo;
	}

	public void setDgmaNo(int dgmaNo) {
		this.dgmaNo = dgmaNo;
	}

	public String getDgmaStatA() {
		return dgmaStatA;
	}

	public void setDgmaStatA(String dgmaStatA) {
		this.dgmaStatA = dgmaStatA;
	}

	public String getDgmaStatB() {
		return dgmaStatB;
	}

	public void setDgmaStatB(String dgmaStatB) {
		this.dgmaStatB = dgmaStatB;
	}

	public String getDgmaStatC() {
		return dgmaStatC;
	}

	public void setDgmaStatC(String dgmaStatC) {
		this.dgmaStatC = dgmaStatC;
	}

	public String getDgmaStatD() {
		return dgmaStatD;
	}

	public void setDgmaStatD(String dgmaStatD) {
		this.dgmaStatD = dgmaStatD;
	}

	public int getDgmaExp() {
		return dgmaExp;
	}

	public void setDgmaExp(int dgmaExp) {
		this.dgmaExp = dgmaExp;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
}
