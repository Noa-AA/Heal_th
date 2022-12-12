package daeyeon.dto;

public class RoomList {
		
	private int chatListNo;
	private int userNo;
	private int roomNo;
	private String userNick;
	
	public RoomList() {	}

	public RoomList(int chatListNo, int userNo, int roomNo, String userNick) {
		super();
		this.chatListNo = chatListNo;
		this.userNo = userNo;
		this.roomNo = roomNo;
		this.userNick = userNick;
	}

	@Override
	public String toString() {
		return "RoomList [chatListNo=" + chatListNo + ", userNo=" + userNo + ", roomNo=" + roomNo + ", userNick="
				+ userNick + "]";
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

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	
	
	
	
	
	
}
