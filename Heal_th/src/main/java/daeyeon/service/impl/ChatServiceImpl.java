package daeyeon.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import daeyeon.dao.face.ChatDao;
import daeyeon.dto.Chat;
import daeyeon.dto.ChatFile;
import daeyeon.dto.ChatRoom;
import daeyeon.dto.RoomList;
import daeyeon.service.face.ChatService;
import daeyeon.util.AdminUserPaging;
import daeyeon.util.ChatIntroPaging;
import yerim.dto.Users;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired ChatDao chatDao;
	
	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;
	
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
	
	
	// /chat/intro
	//---------- 검색된 총 게시글 조회하기
	@Override
	public ChatIntroPaging getSearchPaging(ChatIntroPaging chatIntroPaging, String curPage) {
		logger.info("getSearchPaging");
		
		//총 게시글 수 조회하기
		int totalCount = chatDao.selectSearchCntAll(chatIntroPaging);
						
		logger.info("totalCount : {}", totalCount);
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}

		//AdminPaging객체 생성
		ChatIntroPaging chatPagingResult = new ChatIntroPaging(totalCount, curPage2);
						
		return chatPagingResult;
	}
	
	@Override
	public List<Users> userSearchlist(ChatIntroPaging chatIntroPaging) {
		logger.info("userSearchlist() - 이거 {}", chatIntroPaging);
		
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> userList = chatDao.selectSearchUsers(chatIntroPaging); 
			
		logger.info("서비스에 검색된 userList : {}", userList);
				
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
	//---------- 상대방 프로필 가져오기
	@Override
	public String getReciverProfile(RoomList roomNo) {
		logger.info("getReciverProfile() - {}", roomNo);
		return chatDao.selectReciverProfile(roomNo);
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
	
	
	// /chat/fileup
	//---------- 첨부된 파일 DB에 저장하기
	@Override
	public ChatFile fileSave(MultipartFile file, int userNo, int roomNo) {
		logger.info("fileSave() - {}", file);
		
		//파일의 크기가 0일 때 파일 업로드 처리 중단
		if( file.getSize() <= 0 ) {
			logger.info("파일의 크기가 0, 처리 중단!");
					
			return null;
		}
		
		//파일이 저장될 경로 (RealPath)
		String storedPath = context.getRealPath("upload");
		logger.info("{}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		//저장될 파일 이름 생성하기
		String storedName = file.getOriginalFilename(); //원본파일명

		//파일이 이미지일때만 확장자뒤에 표시해주기
		if(storedName.contains(".png") || storedName.contains(".jpg") || storedName.contains(".jpeg")) {
			logger.info(">>>>>>>>>>>>>>> png가 포함되어있습니다. ★★★★");
			storedName += "+IMG+";
		} 
		
		if(!storedName.contains(".txt")) {
			logger.info("★★★★ storedName {} ★★★★", storedName);
			storedName += UUID.randomUUID().toString().split("-")[0];
			logger.info("★★★★ storedName {} ★★★★", storedName);
		}
		
		//실제 저장될 파일 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			
			//업로드된 파일을 upload폴더에 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		// 채팅(CHAT) 테이블에 chat으로 먼저 추가하기
		Chat chat = new Chat();
		chat.setUserNo(userNo);
		chat.setRoomNo(roomNo);
		chat.setChatContents(storedName);
		
		chatDao.insertChat(chat);
				
		
		//---------------------------------------------------------
		
		//DB에 기록할 정보 객체 - DTO
		ChatFile chatFile = new ChatFile();
				
		
		
		chatFile.setOriginName(file.getOriginalFilename());
		chatFile.setStoredName(storedName);
		chatFile.setUserNo(userNo);
		
		//chat의 마지막 chat_no 구하기
		chatFile.setChatNo(chatDao.selectChatNo()); 
		
		chatDao.insertFile(chatFile);
		
		return chatFile;
	}




	//포인트가 제일 높은 회원 세명 조회
	// /main
	@Override
	public List<Users> topUserList() {
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> topUserList = chatDao.selectTopUsers(); 
					
		logger.info("서비스에 검색된 topUserList : {}", topUserList);
						
		return topUserList;
	}







}









