package hyunkyung.dto;

public class ParticipantList {
	
	private int participantNo;
	private int userNo;
	private int challengeNo;
	
	public ParticipantList() {
	}

	public ParticipantList(int participantNo, int userNo, int challengeNo) {
		super();
		this.participantNo = participantNo;
		this.userNo = userNo;
		this.challengeNo = challengeNo;
	}

	@Override
	public String toString() {
		return "ParticipantList [participantNo=" + participantNo + ", userNo=" + userNo + ", challengeNo=" + challengeNo
				+ "]";
	}

	public int getParticipantNo() {
		return participantNo;
	}

	public void setParticipantNo(int participantNo) {
		this.participantNo = participantNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getChallengeNo() {
		return challengeNo;
	}

	public void setChallengeNo(int challengeNo) {
		this.challengeNo = challengeNo;
	}
	
	

}
