package daeyeon.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import daeyeon.dto.ChatRoom;
import daeyeon.dto.Userss;
import daeyeon.service.face.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {

	
	//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired private ChatService chatService;
			
		
		//테스트용 헤더~~~~
		@RequestMapping("/header")
		public void header() {
			
		}
		
		
		@GetMapping("/login")
		public void login() {
			logger.info("/login");
		}
		
		@PostMapping("/login")
		public String loginOk(HttpSession session, String id, String pw ) {
			logger.info("/loginOk");
			logger.info("id :" + id);
			logger.info("pw :" + pw);
			
			Userss users = new Userss();
			
			//테스트용~~---------------------------------나중에 지움
			if( id.equals("aaa") ) {
				users.setUserNo(10);
				session.setAttribute("userNo", 10);
				
			} else if(id.equals("bbb")) {
				users.setUserNo(20);
				session.setAttribute("userNo", 20);
			} else {
				users.setUserNo(0);
			}
			
			System.out.println( "유저번호 : " + session.getAttribute("userNo") );
			//테스트용~~
			
			session.setAttribute("userId", id);
			
			return "/chat/main";
		}
			
		
		@RequestMapping("/chatRoom")
		public void goChat(Model model, HttpSession session, ChatRoom chatRoom, Userss users) {
			logger.info("/goChat");
			
			//테스트~~
			chatService.selectRoomNoByUserNo(session);
			
			
//			socketService.createRoom();
			String userId = (String) session.getAttribute("userId");
			
//			logger.info( "채팅방 번호 : {}", chatRoom );
			
			model.addAttribute("userId", userId);
		}
	
	
}
