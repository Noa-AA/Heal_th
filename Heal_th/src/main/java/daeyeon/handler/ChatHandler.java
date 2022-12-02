package daeyeon.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import daeyeon.dto.RoomList;

@RequestMapping(value = "/chat", method = RequestMethod.GET)
public class ChatHandler extends TextWebSocketHandler {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<Integer, Object> sessionList = new HashMap<Integer, Object>();
	
//	@Autowired private ChatService chatService;
	
	
	// afterConnectionEstablished : 웹소켓이 연결되면 호출되는 함수
	// 클라이언트와 연결 이후에 실행되는 메서드
    // 웹소켓이 연결 되는 것 = 프론트에서 웹소켓이 정확한 경로를 잡아 생성 되는 것
    @Override
    public void afterConnectionEstablished( WebSocketSession session ) throws Exception {
    	String Id = (String)session.getAttributes().get("userId");
    	int userNo = (Integer)session.getAttributes().get("userNo");
    	RoomList roomNo = (RoomList)session.getAttributes().get("roomNo"); 
    	
    	sessionList.put(roomNo.getRoomNo(), session);
//    	sessionList.add(session);
    	logger.info( "아이디 : {} 유저번호 : {} 연결됨", Id, userNo );
    	logger.info( "방번호 : {}", roomNo.getRoomNo() );
    	
    }

    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메서드
    // WebSocketSession session : 전송 주체 정보가 담긴 세션
    // TextMessage message : 전송 받은 메세지 정보
    @Override
    protected void handleTextMessage( WebSocketSession session, TextMessage message) throws Exception {
    	String Id = (String)session.getAttributes().get("userId");
    	int userNo = (Integer)session.getAttributes().get("userNo");
    	
    	logger.info( "{}로 부터 {} 받음", Id, message.getPayload() );
    	
    	logger.info("sessionList : {}", sessionList);
    	
//    	for (WebSocketSession sess : sessionList) {
//    		sess.sendMessage(new TextMessage(Id + " : " + message.getPayload()));
//    	}
    	
//    	chatService.insertChat();
    	
    	
    }

    // 클라이언트와 연결을 끊었을 때 실행되는 메소드
    // afterConnectionClosed : 웹소켓이 연결이 종료되면 호출되는 함수
    // 웹소켓이 연결이 종료 = 세션 종료
    @Override
    public void afterConnectionClosed( WebSocketSession session, CloseStatus status) throws Exception {
    	sessionList.remove(session);
    	logger.info("아이디 : {} - 연결 끊김", session.getId() );
    	
    }
	
	
	
	
}


















