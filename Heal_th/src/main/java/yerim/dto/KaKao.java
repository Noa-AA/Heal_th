package yerim.dto;

public class KaKao {
	private int kakaoNo;
	private int userNo;
	private String kakaoId;
	private String kakaoPw;
	
	public KaKao() {}

	public KaKao(int kakaoNo, int userNo, String kakaoId, String kakaoPw) {
		super();
		this.kakaoNo = kakaoNo;
		this.userNo = userNo;
		this.kakaoId = kakaoId;
		this.kakaoPw = kakaoPw;
	}

	@Override
	public String toString() {
		return "KaKao [kakaoNo=" + kakaoNo + ", userNo=" + userNo + ", kakaoId=" + kakaoId + ", kakaoPw=" + kakaoPw
				+ "]";
	}

	public int getKakaoNo() {
		return kakaoNo;
	}

	public void setKakaoNo(int kakaoNo) {
		this.kakaoNo = kakaoNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getKakaoPw() {
		return kakaoPw;
	}

	public void setKakaoPw(String kakaoPw) {
		this.kakaoPw = kakaoPw;
	}
	
//	
	

}
