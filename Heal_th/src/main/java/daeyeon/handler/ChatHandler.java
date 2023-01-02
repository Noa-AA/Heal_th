package daeyeon.handler;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import daeyeon.dto.Chat;
import daeyeon.service.face.ChatService;

@RequestMapping(value = "/chat", method = RequestMethod.GET)
public class ChatHandler extends TextWebSocketHandler {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private Map<WebSocketSession, Integer> sessionRoomNo = new HashMap<WebSocketSession, Integer>();
	private Map<Integer ,WebSocketSession> userNoSession = new HashMap<Integer ,WebSocketSession>();
	
	@Autowired private ChatService chatService;

	
	// afterConnectionEstablished : 웹소켓이 연결되면 호출되는 함수
	// 클라이언트와 연결 이후에 실행되는 메서드
    // 웹소켓이 연결 되는 것 = 프론트에서 웹소켓이 정확한 경로를 잡아 생성 되는 것
    @Override
    public void afterConnectionEstablished( WebSocketSession session ) throws Exception {
    	String Id = (String)session.getAttributes().get("userId");
    	int userNo = (Integer)session.getAttributes().get("userNo");
    	
    	logger.info("들어 왔다이~");
    	logger.info("session : {}", session);
    	logger.info("userNo : {}", userNo); 
    	
    	
    	userNoSession.put(userNo, session);
    	if ( session.getAttributes().get("roomNo") != null) {
    		int roomNo = (Integer)session.getAttributes().get("roomNo"); 
    		sessionRoomNo.put(session, roomNo);
    		
    		logger.info( ">>> 방번호 : {}", roomNo);
    	}
    	
    	logger.info( ">>> 아이디 : {} 유저번호 : {} 연결됨", Id, userNo );
    	
    	
    }
    
    

    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메서드
    // WebSocketSession session : 전송 주체 정보가 담긴 세션
    // TextMessage message : 전송 받은 메세지 정보
    @Override
    protected void handleTextMessage( WebSocketSession session, TextMessage message ) throws Exception {
    	int roomNo = (int)session.getAttributes().get("roomNo"); 
    	int userNo = (Integer)session.getAttributes().get("userNo");
    	String userNick = (String)session.getAttributes().get("userNick");
    	
    	//방생성시 판단
//    	int createRoomNo = (int)session.getAttributes().get("createRoomNo"); 
    	
    	Chat chat = new Chat();
    	
    	logger.info( "{}로 부터 {} 받음", userNick, message.getPayload() );
    	
    	logger.info(">>> sessionRoomNo : {}", sessionRoomNo);
    	logger.info(">>> userNoSession : {}", userNoSession);
    	
    	//메세지 보내기
    	for( int userNoKey : userNoSession.keySet() ) {
    		
    		//같은방 유저에게 메세지 보내기
    		if( sessionRoomNo.get(userNoSession.get(userNoKey)) == roomNo ) {
    			
    			//메세지가 이미지 형식일때
    			if( message.getPayload().contains("+IMG+") ) {
    				userNoSession.get(userNoKey).sendMessage(new TextMessage(userNick + " : " + "+IMG+" + " : " + message.getPayload() + " : " + roomNo));
    			
    			} else if( message.getPayload().contains(".txt") ) {
    				userNoSession.get(userNoKey).sendMessage(new TextMessage(userNick + " : " + "+FILE+" + " : " + message.getPayload() + " : " + roomNo));
    			
    			} else {
    				//일반 메세지일때
    				userNoSession.get(userNoKey).sendMessage(new TextMessage(userNick + " : " + message.getPayload() + " : " + roomNo));
    			}
    		}
    		
    		//룸리스트에 미리보기 메세지 보내기 - 다른방에있는 사람도 자신한테 온건 볼수 있어야함
    		userNoSession.get(userNoKey).sendMessage(new TextMessage(userNick + " : " + "listChat" + " : " + message.getPayload() + " : " + roomNo));
    		
    	}
    	
    	//Chat dto에 데이터 집어넣기
    	chat.setChatContents( message.getPayload() );
    	chat.setRoomNo(roomNo);
    	chat.setUserNo(userNo);
    	
    	//--- chat 테이블에 채팅 데이터 집어넣기
    	if(!message.getPayload().contains("+IMG+") && !message.getPayload().contains(".txt")) {
    		chatService.addChat(chat);
    	}
    } 

    // 클라이언트와 연결을 끊었을 때 실행되는 메소드
    // afterConnectionClosed : 웹소켓이 연결이 종료되면 호출되는 함수
    // 웹소켓이 연결이 종료 = 세션 종료
    @Override 
    public void afterConnectionClosed( WebSocketSession session, CloseStatus status) throws Exception {
    	int userNo = (Integer)session.getAttributes().get("userNo");
    	
    	userNoSession.remove(userNo);
    	sessionRoomNo.remove(session);
    	session.getAttributes().remove("roomNo");
    	
    	
//    	sessionMap.remove(roomNo.getRoomNo());
    	logger.info("아이디 : {} - 연결 끊김", session.getId() );
    	
    }
	
	
	
	
}
