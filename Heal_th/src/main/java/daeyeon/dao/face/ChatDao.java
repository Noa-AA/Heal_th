package daeyeon.dao.face;

import java.util.List;

import daeyeon.dto.RoomList;
import daeyeon.dto.Userss;
import yerim.dto.Users;


public interface ChatDao {
	
	public RoomList selectRoomNoByUserNo(Userss users);

	/**
	 * 회원등급 3이상인 회원 조회하기
	 * 
	 * @return 회원등급 3이상인 회원 목록
	 */
	public List<Users> selectUsers();

//	public void insertChat();

	
//	public void insertChatRoom();
//
//	public void insertroomList();

	
	

}
