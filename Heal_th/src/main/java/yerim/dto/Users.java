package yerim.dto;

import java.util.Date;

public class Users {
	
	private int userNo;
	private String userId;
	private String userPw;
	private String userNick;
	private String userPhone;
	private String userAddress;
	private String userEmail;
	private String userName;
	private String userIntro;
	private String userJob;
	private String userPhoto;
	private Date userJoinDate;
	private String userBirth;
	private String userGender;
	private int dgMoney;																	
	private int point;
	private int rankingNo;
	private int kakaNo;
	private int naverNo;
	private String joinType;
	

	public Users() {}


	public Users(int userNo, String userId, String userPw, String userNick, String userPhone, String userAddress,
			String userEmail, String userName, String userIntro, String userJob, String userPhoto, Date userJoinDate,
			String userBirth, String userGender, int dgMoney, int point, int rankingNo, int kakaNo, int naverNo,
			String joinType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userIntro = userIntro;
		this.userJob = userJob;
		this.userPhoto = userPhoto;
		this.userJoinDate = userJoinDate;
		this.userBirth = userBirth;
		this.userGender = userGender;
		this.dgMoney = dgMoney;
		this.point = point;
		this.rankingNo = rankingNo;
		this.kakaNo = kakaNo;
		this.naverNo = naverNo;
		this.joinType = joinType;
	}


	@Override
	public String toString() {
		return "Users [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick
				+ ", userPhone=" + userPhone + ", userAddress=" + userAddress + ", userEmail=" + userEmail
				+ ", userName=" + userName + ", userIntro=" + userIntro + ", userJob=" + userJob + ", userPhoto="
				+ userPhoto + ", userJoinDate=" + userJoinDate + ", userBirth=" + userBirth + ", userGender="
				+ userGender + ", dgMoney=" + dgMoney + ", point=" + point + ", rankingNo=" + rankingNo + ", kakaNo="
				+ kakaNo + ", naverNo=" + naverNo + ", joinType=" + joinType + "]";
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserNick() {
		return userNick;
	}


	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserIntro() {
		return userIntro;
	}


	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}


	public String getUserJob() {
		return userJob;
	}


	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}


	public String getUserPhoto() {
		return userPhoto;
	}


	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}


	public Date getUserJoinDate() {
		return userJoinDate;
	}


	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}


	public String getUserBirth() {
		return userBirth;
	}


	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}


	public String getUserGender() {
		return userGender;
	}


	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}


	public int getDgMoney() {
		return dgMoney;
	}


	public void setDgMoney(int dgMoney) {
		this.dgMoney = dgMoney;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public int getRankingNo() {
		return rankingNo;
	}


	public void setRankingNo(int rankingNo) {
		this.rankingNo = rankingNo;
	}


	public int getKakaNo() {
		return kakaNo;
	}


	public void setKakaNo(int kakaNo) {
		this.kakaNo = kakaNo;
	}


	public int getNaverNo() {
		return naverNo;
	}


	public void setNaverNo(int naverNo) {
		this.naverNo = naverNo;
	}


	public String getJoinType() {
		return joinType;
	}


	public void setJoinType(String joinType) {
		this.joinType = joinType;
	}



}
