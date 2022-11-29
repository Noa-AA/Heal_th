package daeyeon.service.face;

import javax.servlet.http.HttpSession;

import daeyeon.dto.RoomList;

public interface ChatService {

	/**
	 * 유저번호를 이용해서 채팅방번호 알아내기
	 * 
	 * @param users
	 */
	public RoomList selectRoomNoByUserNo(HttpSession session);
	
	public void insertChat();
	
//	public void createRoom();

	
}
