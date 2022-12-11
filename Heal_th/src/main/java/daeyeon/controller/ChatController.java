package daeyeon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import daeyeon.dto.ChatRoom;
import daeyeon.dto.RoomList;
import daeyeon.dto.Userss;
import daeyeon.service.face.ChatService;
import yerim.dto.Users;

@Controller
@RequestMapping("/chat")
public class ChatController {

	
		//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired ChatService chatService;
		
		
		//1. 멘토 리스트
		@RequestMapping("/intro")
		public void mentorList(HttpSession session, Model model, Users myUserNo) {
			logger.info("/chat/intro");
			
			//자신을 제외하기위한 자신의 회원번호 파라미터
			myUserNo.setUserNo((Integer)session.getAttribute("userNo"));
			
			//회원등급 3이상 회원 조회
			List<Users> userList = chatService.userlist(myUserNo);
				
			//모델값 전달 - Model객체 이용
			model.addAttribute("userList", userList);
		}
		
		
		//2. 포인트 비교 (채팅할때 필요한 포인트를 가지고 있어야 채팅을 할 수 있음)
		@RequestMapping("/pointCompare")
		@ResponseBody
		public String pointCompare(HttpSession session, Users users, int rankingNo) { //여기서 파라미터로 받아오는 rankingNo는 클릭한 사람의 랭킹
			logger.info("/pointCompare");
			logger.info("클릭한 사람의 랭킹 : {}", rankingNo);
			//dto에 상대방 랭킹 삽입하기
			session.setAttribute("yourRankingNo", rankingNo);
			
			//세션에있는 내 회원번호 dto에 넣기
			users.setUserNo((Integer)session.getAttribute("userNo"));
			logger.info("내 회원번호 : {}", users.getUserNo());
			
			//내 유저넘버로 내 포인트 조회하기
			int myPoint = chatService.getMyPoint(users);
			logger.info("조회한 나의 point : {}", myPoint);
			
			//상대방 랭킹으로 채팅에 필요한 포인트 집어넣기
			int chatPoint = 0;
			
			switch (rankingNo) {
			case 5: 
				chatPoint = 1000;
				break;
			case 4: 
				chatPoint = 700;
				break;
			default:
				chatPoint = 400;
				break;
			}
			logger.info("채팅에 필요한 point : {}", chatPoint);
			//내포인트랑 상대방포인트 조회하기
			
			if( chatPoint <= myPoint ) {
				return "ok";
			} else {
				return "no";
			}
		}
		
		
		//3. 포인트가 충족되면 포인트를 증가 및 차감하고 채팅방 만들기 (채팅방만들고 상대방과 자신이 리스트에 추가되기)
		@RequestMapping("/createChatRoom")
		public String main(Model model, HttpSession session, int userNo, Users users) {
			logger.info("/createChatRoom");
			
			int yourUserNo = userNo; //상대방 유저넘버
			int myUserNo = (Integer)session.getAttribute("userNo"); //자신의 유저넘버
			int yourRankingNo = (Integer)session.getAttribute("yourRankingNo");
			
			
			logger.info("채팅신청할 상대방 유저넘버 : {}", yourUserNo );
			logger.info("내 유저넘버 : {}", myUserNo );
			
			//내 포인트는 차감시키고 상대방 포인트는 증가시키기
			chatService.updatePoint(yourRankingNo, yourUserNo, myUserNo);
			
			
			// 채팅방만들고 리스트에 하나의 채팅방에 두개의 유저넘버 넣기 insert 세번
			int createRoomNo = chatService.createChatRoom(yourUserNo, myUserNo);
			
			logger.info("만든 채팅방 번호 : {}", createRoomNo);
			session.setAttribute("createRoomNo", createRoomNo);
			
			//유저번호로 방번호 불러오기
//			chatService.selectRoomNoByUserNo(session);
			
			return "redirect: /chat/chatRoom";
			
		}
		
		
		//3. 채팅룸의 자신의 소속된 채팅방 조회하기
		@RequestMapping("/chatRoom")
		public void chatRoom(HttpSession session, Users myUserNo, Model model) {
			logger.info("/chatRoom");
			myUserNo.setUserNo((Integer)session.getAttribute("userNo"));
			
			logger.info("myUserNo : {}", myUserNo.getUserNo());
			
			List<RoomList> roomList = chatService.roomList(myUserNo);
			
			model.addAttribute("createRoomNo", session.getAttribute("createRoomNo"));
			
//			채팅방 번호 전달 - Model객체 이용
			model.addAttribute("roomList", roomList);
			
		}
		
			
		//4. 채팅 영역
		@RequestMapping("/chatArea")
		public void goChat(Model model, HttpSession session, RoomList roomNo, Userss users) {
			logger.info("/chatArea");
			logger.info( "채팅방 번호 : {}", roomNo.getRoomNo() );
			 
			session.setAttribute("roomNo", roomNo.getRoomNo());
			
			model.addAttribute("roomNo", roomNo);
			
			
		}
		
		
	
}














