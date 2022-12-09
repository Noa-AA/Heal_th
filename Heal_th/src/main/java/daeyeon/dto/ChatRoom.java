package daeyeon.dto;

import java.util.Date;

public class ChatRoom {

	private int roomNo;
	private int userNo;
	private Date createDate;
	
	public ChatRoom() {	}

	public ChatRoom(int roomNo, int userNo, Date createDate) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", userNo=" + userNo + ", createDate=" + createDate + "]";
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	
	
	
	
}

