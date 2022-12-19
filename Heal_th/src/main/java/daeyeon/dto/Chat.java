package daeyeon.dto;

public class Chat {

	private int chatNo;
	private String chatTime;
	private String chatContents;
	private int roomNo;
	private int userNo;
	
	public Chat() {	}

	public Chat(int chatNo, String chatTime, String chatContents, int roomNo, int userNo) {
		super();
		this.chatNo = chatNo;
		this.chatTime = chatTime;
		this.chatContents = chatContents;
		this.roomNo = roomNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatTime=" + chatTime + ", chatContents=" + chatContents + ", roomNo="
				+ roomNo + ", userNo=" + userNo + "]";
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getChatTime() {
		return chatTime;
	}

	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

	public String getChatContents() {
		return chatContents;
	}

	public void setChatContents(String chatContents) {
		this.chatContents = chatContents;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
	
	
}
