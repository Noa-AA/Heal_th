package changmin.dto;

public class Dgmagotchi {

	private int dgmaNo;
	private int dgmaStata;
	private int dgmaStatb;
	private int dgmaStatc;
	private int dgmaStatd;
	private int dgmaExp;
	private int userNo;
	
	public Dgmagotchi() {}

	public Dgmagotchi(int dgmaNo, int dgmaStata, int dgmaStatb, int dgmaStatc, int dgmaStatd, int dgmaExp, int userNo) {
		super();
		this.dgmaNo = dgmaNo;
		this.dgmaStata = dgmaStata;
		this.dgmaStatb = dgmaStatb;
		this.dgmaStatc = dgmaStatc;
		this.dgmaStatd = dgmaStatd;
		this.dgmaExp = dgmaExp;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Dgmagotchi [dgmaNo=" + dgmaNo + ", dgmaStata=" + dgmaStata + ", dgmaStatb=" + dgmaStatb + ", dgmaStatc="
				+ dgmaStatc + ", dgmaStatd=" + dgmaStatd + ", dgmaExp=" + dgmaExp + ", userNo=" + userNo + "]";
	}

	public int getDgmaNo() {
		return dgmaNo;
	}

	public void setDgmaNo(int dgmaNo) {
		this.dgmaNo = dgmaNo;
	}

	public int getDgmaStata() {
		return dgmaStata;
	}

	public void setDgmaStata(int dgmaStata) {
		this.dgmaStata = dgmaStata;
	}

	public int getDgmaStatb() {
		return dgmaStatb;
	}

	public void setDgmaStatb(int dgmaStatb) {
		this.dgmaStatb = dgmaStatb;
	}

	public int getDgmaStatc() {
		return dgmaStatc;
	}

	public void setDgmaStatc(int dgmaStatc) {
		this.dgmaStatc = dgmaStatc;
	}

	public int getDgmaStatd() {
		return dgmaStatd;
	}

	public void setDgmaStatd(int dgmaStatd) {
		this.dgmaStatd = dgmaStatd;
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
