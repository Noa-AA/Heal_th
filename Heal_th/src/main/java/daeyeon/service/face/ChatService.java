package daeyeon.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import daeyeon.dto.Chat;
import daeyeon.dto.ChatRoom;
import daeyeon.dto.RoomList;
import yerim.dto.Users;

public interface ChatService {

	
	/**
	 * chat/intro
	 * 
	 * 회원 등급 3이상인 회원 조회하기
	 * 
	 * @return List<Users> -  회원등급 3이상인 회원목록
	 */
	public List<Users> userlist(Users myUserNo);

	
	/**
	 * chat/chatRoom
	 * 
	 * 유저번호를 이용해서 소속된 채팅방 조회하기
	 * 
	 * @return List - 조회된 채팅방
	 */
	public List<RoomList> roomList(Users myUserNo);


	/**
	 * chat/chatArea
	 * 
	 * 채팅내용 저장하기
	 * 
	 * @param chat -  회원번호, 채팅방 번호, 채팅 내용이 담긴 Chat dto
	 */
	public void addChat(Chat chat);


	/**
	 * chat/pointCompare
	 * 
	 * @param users - 본인의 회원번호
	 * @return - 회원번호로 조회한 포인트
	 */
	public int getMyPoint(Users users);

	
	/**
	 * chat/createChatRoom
	 * 
	 * 상대방 포인트는 증가시키고 내 포인트는 차감시키기
	 * 
	 * @param yourRankingNo - 상대방의 랭킹번호
	 * @param yourUserNo - 상대방의 회원번호
	 * @param myUserNo - 자신의 회원번호
	 */
	public void updatePoint(int yourRankingNo, int yourUserNo, int myUserNo);
	
	
	/**
	 * chat/createChatRoom
	 * 
	 * 상대방과 채팅할 채팅방 만들기
	 * 
	 * @param yourUserNo - 상대방 회원번호
	 * @param myUserNo - 로그인한 자신의 회원번호
	 */
	public void createChatRoom(int yourUserNo, int myUserNo);


	
	

	
}
