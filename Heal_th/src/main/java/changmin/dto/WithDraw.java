package changmin.dto;

public class WithDraw {
	private int wdNo;
	private int wdAmount;
	private String wdProcess;
	private int userNo;

	public WithDraw() {}

	@Override
	public String toString() {
		return "WithDraw [wdNo=" + wdNo + ", wdAmount=" + wdAmount + ", wdProcess=" + wdProcess + ", userNo=" + userNo
				+ "]";
	}

	public WithDraw(int wdNo, int wdAmount, String wdProcess, int userNo) {
		super();
		this.wdNo = wdNo;
		this.wdAmount = wdAmount;
		this.wdProcess = wdProcess;
		this.userNo = userNo;
	}

	public int getWdNo() {
		return wdNo;
	}

	public void setWdNo(int wdNo) {
		this.wdNo = wdNo;
	}

	public int getWdAmount() {
		return wdAmount;
	}

	public void setWdAmount(int wdAmount) {
		this.wdAmount = wdAmount;
	}

	public String getWdProcess() {
		return wdProcess;
	}

	public void setWdProcess(String wdProcess) {
		this.wdProcess = wdProcess;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
