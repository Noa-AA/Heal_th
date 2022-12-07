package daeyeon.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import daeyeon.dto.Chat;
import daeyeon.dto.RoomList;
import yerim.dto.Users;

public interface ChatService {

	
	/**
	 * 유저번호를 이용해서 채팅방번호 알아내기
	 * 
	 * @param users
	 */
//	public RoomList selectRoomNoByUserNo(HttpSession session);

	
	/**
	 * 회원 등급 3이상인 회원 조회하기
	 * 
	 * @return List<Users> -  회원등급 3이상인 회원목록
	 */
	public List<Users> userlist();

	
	/**
	 * 유저번호를 이용해서 소속된 채팅방 조회하기
	 * 
	 * @return List - 조회된 채팅방
	 */
	public List<RoomList> roomList(Users myUserNo);


	/**
	 * 채팅내용 저장하기
	 * 
	 * @param chat -  회원번호, 채팅방 번호, 채팅 내용이 담긴 Chat dto
	 */
	public void addChat(Chat chat);
	
	
//	public void createRoom();

	
}
