package daeyeon.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daeyeon.dao.face.ChatDao;
import daeyeon.dto.Chat;
import daeyeon.dto.RoomList;
import daeyeon.dto.Userss;
import daeyeon.service.face.ChatService;
import yerim.dto.Users;

@Service
public class ChatServiceImpl implements ChatService {

@Autowired ChatDao chatDao;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

//	@Override
//	public RoomList selectRoomNoByUserNo(HttpSession session) {
//		Userss users = new Userss();
//		
//		RoomList roomList = new RoomList();
//		
//		//세션에있는 유저넘버값
//		logger.info("userNo = {}", session.getAttribute("userNo") );
//		
//		users.setUserNo( (Integer)session.getAttribute("userNo") );
//		
//		roomList = chatDao.selectRoomNoByUserNo(users);
//		
//		logger.info("roomlist = {}", roomList);
//		
//		return roomList;
//	}
	
	
	//---------- 회원 등급 3이상인 회원 조회하기
	@Override
	public List<Users> userlist() {
		logger.info("userlist()");
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> userList = chatDao.selectUsers(); 
		logger.trace("boardList 조회 결과"); 
		for( Users d : userList )	logger.info("{}", d);
		
		return userList;
	}
	
	
	
	
	//---------- 유저번호를 이용해서 소속된 채팅방 조회하기
	@Override
	public List<RoomList> roomList(Users myUserNo) {
		logger.info("roomList() - {}", myUserNo);
		
		//채팅방 목록 조회 - ChatDao 이용
		List<RoomList> roomList = chatDao.selectRoomList(myUserNo); 
		
		return roomList;
	}
	
	
	//---------- 채팅 내용 저장하기
	@Override
	public void addChat(Chat chat) {
		logger.info("addChat() - {}", chat);
		
		chatDao.insertChat(chat);
	}
	
}






















