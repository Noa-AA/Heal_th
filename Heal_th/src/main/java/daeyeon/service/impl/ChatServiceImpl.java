package daeyeon.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daeyeon.dao.face.ChatDao;
import daeyeon.dto.RoomList;
import daeyeon.dto.Userss;
import daeyeon.service.face.ChatService;
import yerim.dto.Users;

@Service
public class ChatServiceImpl implements ChatService {

@Autowired ChatDao chatDao;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public RoomList selectRoomNoByUserNo(HttpSession session) {
		Userss users = new Userss();
		
		RoomList roomList = new RoomList();
		
		//세션에있는 유저넘버값
		logger.info("userNo = {}", session.getAttribute("userNo") );
		
		users.setUserNo( (Integer)session.getAttribute("userNo") );
		
		roomList = chatDao.selectRoomNoByUserNo(users);
		
		logger.info("roomlist = {}", roomList);
		
		return roomList;
	}
	
	
	@Override
	public List<Users> userlist() {
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> userList = chatDao.selectUsers(); 
		logger.trace("boardList 조회 결과"); 
		for( Users d : userList )	logger.info("{}", d);
		
		return userList;
	}
	
	
	
	
	
	@Override
	public List<RoomList> roomList(int myUserNo) {
	
	//채팅방 목록 조회 - ChatDao 이용
	List<RoomList> roomList = chatDao.selectRoomList(myUserNo); 
	
		
	return roomList;
		
	}
	
}




