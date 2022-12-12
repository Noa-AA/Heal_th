package daeyeon.dao.face;

import java.util.List;

import daeyeon.dto.Chat;
import daeyeon.dto.ChatRoom;
import daeyeon.dto.RoomList;
import yerim.dto.Users;


public interface ChatDao {
	

	/**
	 * chat/intro
	 * 
	 * 회원등급 3이상인 회원 조회하기
	 * 
	 * @return 회원등급 3이상인 회원 목록
	 */
	public List<Users> selectUsers(Users myUserNo);

	
	/**
	 * chat/chatRoom
	 * 
	 * 자신의 회원번호가 속한 채팅방번호와 상대방 닉네임 조회하기
	 * 
	 * @param myUserNo - 자신의 회원번호
	 * @return - 조회된 채팅방번호와 상대방 닉네임
	 */
	public List<RoomList> selectRoomList(Users myUserNo);


	/**
	 * chat/chatArea
	 * 
	 * 채팅내용 테이블에 저장하기
	 * 
	 * @param chat - 회원번호, 채팅방 번호, 채팅 내용이 담긴 Chat dto
	 */
	public void insertChat(Chat chat);


	/**
	 * chat/pointCompare
	 * 
	 * @param users 자신의 유저번호가 담긴 dto
	 * @return 조회된 자신의 포인트
	 */
	public int selectMyPoint(Users users);


	/**
	 * chat/createChatRoom
	 * 
	 * 상대방 포인트 증가시키기
	 * 
	 * @param Users - 조회할 rankingNo, userNo 가 들어간 dto
	 */
	public void updateYourPoint(Users users);

	
	/**
	 * chat/createChatRoom
	 * 
	 * 자신의 포인트 감소시키기
	 * 
	 * 	@param Users - 조회할 rankingNo, userNo 가 들어간 dto
	 */
	public void updateMyPoint(Users users);
	
	
	/**
	 * chat/createChatRoom
	 * 
	 * 채팅방 만들기
	 * 
	 * @return int - 생성된 채팅방번호
	 */
	public int insertChatRoom(ChatRoom chatRoom);

	
	/**
	 * chat/createChatRoom
	 * 
	 * @param chatRoom - 추가될 상대방의 회원번호, 채팅방번호
	 */
	public void insertChatListByMy(ChatRoom chatRoom);
	
	/**
	 * chat/createChatRoom
	 * 
	 * @param chatRoom - 추가될 상대방의 회원번호, 채팅방번호
	 */
	public void insertChatListByYou(ChatRoom chatRoom);


	/**
	 * chat/chatArea
	 * 
	 * 룸번호로 상대방 이름 조회하기
	 * 
	 * @param roomNo - 방번호와 자신의 회원번호가 저장되있는 dto
	 * @return - 같은 채팅방의 상대방 이름
	 */
	public String selectReciverNick(RoomList roomNo);


	

	
	

}
