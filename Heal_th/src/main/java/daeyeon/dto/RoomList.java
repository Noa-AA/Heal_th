package daeyeon.dto;

public class RoomList {
		
	private int chatListNo;
	private int userNo;
	private int roomNo;
	
	public RoomList() {	}

	public RoomList(int chatListNo, int userNo, int roomNo) {
		super();
		this.chatListNo = chatListNo;
		this.userNo = userNo;
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "RoomList [chatListNo=" + chatListNo + ", userNo=" + userNo + ", roomNo=" + roomNo + "]";
	}

	public int getChatListNo() {
		return chatListNo;
	}

	public void setChatListNo(int chatListNo) {
		this.chatListNo = chatListNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	
	
	
}
