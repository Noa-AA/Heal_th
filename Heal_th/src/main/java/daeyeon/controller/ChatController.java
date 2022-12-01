package daeyeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import daeyeon.dto.Userss;
import daeyeon.service.face.ChatService;
import yerim.dto.Users;

@Controller
@RequestMapping("/chat")
public class ChatController {

	
		//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired ChatService chatService;
		
		//테스트용 헤더~~~~
		@RequestMapping("/header")
		public void header() {
			
		}
		
		//멘토 리스트
		@RequestMapping("/mentorList")
		public void mentorList(Model model) {
		logger.info("/chat/mentorList");
			
		//회원등급 3이상 회원 조회
		List<Users> userList = chatService.userlist();
			
		//모델값 전달 - Model객체 이용
		model.addAttribute("userList", userList);
			
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
				session.setAttribute("roomNo", 1);
				
			} else if(id.equals("bbb")) {
				users.setUserNo(20);
				session.setAttribute("userNo", 20);
				session.setAttribute("roomNo", 1);
			} else if(id.equals("ccc")) {
				users.setUserNo(30);
				session.setAttribute("userNo", 30);
				session.setAttribute("roomNo", 2);
			} else {
				users.setUserNo(40);
				session.setAttribute("userNo", 40);
				session.setAttribute("roomNo", 2);
			}
				
			
			System.out.println( "유저번호 : " + session.getAttribute("userNo") );
			//테스트용~~
			
			session.setAttribute("userId", id);
			
			return "/chat/main";
		}
			
		
		@RequestMapping("/chatRoom")
		public String goChat(Model model, HttpSession session, int roomNo, Userss users) {
			logger.info("/chatRoom");
			
			//유저번호로 방번호 불러오기
//			chatService.selectRoomNoByUserNo(session);
			
//			socketService.createRoom();
			
//			logger.info( "채팅방 번호 : {}", chatRoom );
			
			model.addAttribute("roomNo", roomNo);
			return ("/chat/chatRoom");
			
		}
		
		
	
}














