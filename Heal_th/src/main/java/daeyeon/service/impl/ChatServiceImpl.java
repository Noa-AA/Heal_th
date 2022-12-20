package daeyeon.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.util.DgHelperPaging;
import daeyeon.dao.face.ChatDao;
import daeyeon.dto.Chat;
import daeyeon.dto.ChatRoom;
import daeyeon.dto.RoomList;
import daeyeon.service.face.ChatService;
import daeyeon.util.ChatIntroPaging;
import yerim.dto.Users;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired ChatDao chatDao;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	// /chat/intro
	//---------- 페이징 정보 조회하기
	@Override
	public ChatIntroPaging getChatIntroPaging(String curPage, Users myUserNo) {
		
		//총 게시글 수 조회하기
		int totalCount = chatDao.selectCntAll(myUserNo);
				
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}
				
		//DgHelperPaging객체 생성
		ChatIntroPaging chatIntroPaging = new ChatIntroPaging(totalCount, curPage2);
				
		return chatIntroPaging;
	}
	
	
	// /chat/intro
	//---------- 회원 등급 3이상인 회원 조회하기
	@Override
	public List<Users> userlist(Users myUserNo, ChatIntroPaging chatIntroPaging) {
		logger.info("userlist()");
		chatIntroPaging.setUserNo(myUserNo.getUserNo());
		 
		//게시글 목록 조회 - ChatDao 이용
		List<Users> userList = chatDao.selectUsers(chatIntroPaging); 
		
		//나랑 같이 방에 소속된  
		
		return userList;
	}
	
	
	// /chat/pointCompare
	//---------- 자신의 포인트 조회해오기
	@Override
	public int getMyPoint(Users users) {
		
		
		return chatDao.selectMyPoint(users);
	}
	
	
	// /chat/createChatRoom
	//---------- 상대방 포인트는 증가시키고 내 포인트는 감소시키기
	@Override
	public void updatePoint(int yourRankingNo, int yourUserNo, int myUserNo) {
		logger.info(">>updatePoint() - yourRankingNo : {} ", yourRankingNo );
		logger.info(">>updatePoint() - yourUserNo : {} ", yourUserNo );
		logger.info(">>updatePoint() - myUserNo : {} ", myUserNo );
		Users users = new Users();
		
		users.setRankingNo(yourRankingNo);
		
		
		//상대방의 포인트 증가시키기
		users.setUserNo(yourUserNo);
		chatDao.updateYourPoint(users);
		
		//자신의 포인트 감소시키기
		users.setUserNo(myUserNo);
		chatDao.updateMyPoint(users);
	}
	
	
	// /chat/createChatRoom
	//---------- 채팅방 만들기
	@Override
	public int createChatRoom(int yourUserNo, int myUserNo, HttpSession session) {
		logger.info("createChatRoom() - yourUserNo : {} , myUserNo : {}", yourUserNo, myUserNo);
				
		ChatRoom chatRoom = new ChatRoom();
		
		//채팅방 만들기
		int result = chatDao.insertChatRoom(chatRoom);
				
		//방을 만들때 사용된 방번호(chat_room_seq.next로 조회)
		logger.info("채팅방 만들때 사용된 방번호 : {}", chatRoom.getRoomNo());  
		chatRoom.setRoomNo(chatRoom.getRoomNo());
				
		
		if( result > 0) { //채팅방 만들기 성공시
					
			chatRoom.setUserNo(myUserNo);
			chatDao.insertChatListByMy(chatRoom); //자신의 룸리스트 만들기
			
			chatRoom.setUserNo(yourUserNo);
			chatDao.insertChatListByYou(chatRoom); //상대방 룸리스트 만들기
			
			return chatRoom.getRoomNo();
			
		} 
		
		return chatRoom.getRoomNo();
	}
	
	
	// /chat/chatRoom
	//---------- 자신이 속한 채팅방번호와 상대방 닉네임 조회하기
	@Override
	public List<RoomList> roomList(Users myUserNo) {
		logger.info("●●●●● Service > roomList() - {} ●●●●●", myUserNo);
			
		//채팅방 목록 조회 - ChatDao 이용
		List<RoomList> roomList = chatDao.selectRoomList(myUserNo);
			
		logger.info("roomList : {}", roomList);
		return roomList;
	}
	
	// /chat/chatRoom
	//---------- 마지막 채팅내역과 채팅방번호
	@Override
	public List<Chat> getLastChat() {
	// TODO Auto-generated method stub
		logger.info("getLastChat() ");
		
		//마지막 채팅 내역 조회 
		List<Chat> lastChat = chatDao.selectLastChat();
		
		return lastChat;
	}
	
	
	// /chat/chatArea
	//---------- 상대방 닉네임 조회하기
	@Override
	public String getReciverNick(RoomList roomNo) {
		return chatDao.selectReciverNick(roomNo);
	}
	
	// /chat/chatArea
	//---------- 본인의 닉네임 조회하기
	@Override
	public String getSenderNick(HttpSession session) {
		logger.info("getSenderNick() - {}", session.getAttribute("userNo"));
		int myUserNo = (int)session.getAttribute("userNo");
		
		return chatDao.selectSenderNick(myUserNo);
	}
	
	
	// /chat/chatArea
	//---------- 채팅 내용 저장하기
	@Override
	public void addChat(Chat chat) {
		logger.info("addChat() - {}", chat);
		
		chatDao.insertChat(chat);
	}
	
	
	// /chat/chatArea
	//---------- 채팅 내용 불러오기
	@Override
	public List<Chat> gerChatList(RoomList roomNo) {
		logger.info("gerChatList() - {}", roomNo);

		List<Chat> chatList = chatDao.selectChat(roomNo); 
		
		return chatList;
	}
	
}






















