package daeyeon.dao.face;

import daeyeon.dto.RoomList;
import daeyeon.dto.Userss;


public interface ChatDao {
	
	public RoomList selectRoomNoByUserNo(Userss users);

	public void insertChat();

	
//	public void insertChatRoom();
//
//	public void insertroomList();

	
	

}
