package daeyeon.dto;

import java.util.Date;

public class ChatRoom {

	private int roomNo;
	private int chatNo;
	private Date createDate;
	
	public ChatRoom() {	}

	public ChatRoom(int roomNo, int chatNo, Date createDate) {
		super();
		this.roomNo = roomNo;
		this.chatNo = chatNo;
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", chatNo=" + chatNo + ", createDate=" + createDate + "]";
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	
	
}
