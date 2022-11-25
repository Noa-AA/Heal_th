package daeyeon.dto;

import java.util.Date;

public class Chat {

	private int chatNo;
	private Date chatTime;
	private String chatContent;
	private int roomNo;
	private int userNo;
	
	public Chat() {	}

	public Chat(int chatNo, Date chatTime, String chatContent, int roomNo, int userNo) {
		super();
		this.chatNo = chatNo;
		this.chatTime = chatTime;
		this.chatContent = chatContent;
		this.roomNo = roomNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatTime=" + chatTime + ", chatContent=" + chatContent + ", roomNo="
				+ roomNo + ", userNo=" + userNo + "]";
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public Date getChatTime() {
		return chatTime;
	}

	public void setChatTime(Date chatTime) {
		this.chatTime = chatTime;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
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
