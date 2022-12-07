package daeyeon.dao.face;

import java.util.List;

import daeyeon.dto.Chat;
import daeyeon.dto.RoomList;
import yerim.dto.Users;


public interface ChatDao {
	
	
	/**
	 * 유저번호를 이용하여 방번호 조회하기
	 * 
	 * @param users - 조회할 유저번호
	 * @return RoomList - 방번호
	 */
//	public RoomList selectRoomNoByUserNo(Userss users);

	
	/**
	 * 회원등급 3이상인 회원 조회하기
	 * 
	 * @return 회원등급 3이상인 회원 목록
	 */
	public List<Users> selectUsers();

	
	/**
	 * 자신의 회원번호가 속한 채팅방 조회하기
	 * 
	 * @param myUserNo - 자신의 회원번호
	 * @return - 조회된 채팅방들
	 */
	public List<RoomList> selectRoomList(Users myUserNo);


	/**
	 * 채팅내용 테이블에 저장하기
	 * 
	 * @param chat - 회원번호, 채팅방 번호, 채팅 내용이 담긴 Chat dto
	 */
	public void insertChat(Chat chat);
	
//	public void insertChatRoom();
//
//	public void insertroomList();

	
	

}
