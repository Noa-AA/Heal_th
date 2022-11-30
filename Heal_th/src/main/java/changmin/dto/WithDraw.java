package changmin.dto;

public class WithDraw {
	private int wdNo;
	private int wdAmount;
	private String wdProcess;
	private String wdAccount;
	private String wdUsername;
	private String bankName;
	private int userNo;

	public WithDraw() {}

	public WithDraw(int wdNo, int wdAmount, String wdProcess, String wdAccount, String wdUsername, String bankName,
			int userNo) {
		super();
		this.wdNo = wdNo;
		this.wdAmount = wdAmount;
		this.wdProcess = wdProcess;
		this.wdAccount = wdAccount;
		this.wdUsername = wdUsername;
		this.bankName = bankName;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "WithDraw [wdNo=" + wdNo + ", wdAmount=" + wdAmount + ", wdProcess=" + wdProcess + ", wdAccount="
				+ wdAccount + ", wdUsername=" + wdUsername + ", bankName=" + bankName + ", userNo=" + userNo + "]";
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

	public String getWdAccount() {
		return wdAccount;
	}

	public void setWdAccount(String wdAccount) {
		this.wdAccount = wdAccount;
	}

	public String getWdUsername() {
		return wdUsername;
	}

	public void setWdUsername(String wdUsername) {
		this.wdUsername = wdUsername;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
}
