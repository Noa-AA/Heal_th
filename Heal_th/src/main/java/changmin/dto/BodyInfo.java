package changmin.dto;

public class BodyInfo {

	private int bodyNo;
	private Double weight;
	private Double height;
	private String bodyDate;
	private int userNo;
	
	public BodyInfo() {}

	public BodyInfo(int bodyNo, Double weight, Double height, String bodyDate, int userNo) {
		super();
		this.bodyNo = bodyNo;
		this.weight = weight;
		this.height = height;
		this.bodyDate = bodyDate;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "BodyInfo [bodyNo=" + bodyNo + ", weight=" + weight + ", height=" + height + ", bodyDate=" + bodyDate
				+ ", userNo=" + userNo + "]";
	}

	public int getBodyNo() {
		return bodyNo;
	}

	public void setBodyNo(int bodyNo) {
		this.bodyNo = bodyNo;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public String getBodyDate() {
		return bodyDate;
	}

	public void setBodyDate(String bodyDate) {
		this.bodyDate = bodyDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
