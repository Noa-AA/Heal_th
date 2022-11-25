package hyanghee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyanghee.service.BoardService;

@Controller
public class VerifyBoardController {
	
	//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
				
		//서비스 객체
		@Autowired private BoardService boardService;	
		
		
		@RequestMapping("/board/verifyBoard")
		public void main() {
			
			logger.info("/board/verifyBoard");
			
		}
		
		@GetMapping("/board/verifyBoard")
		public void loginForm() {
			logger.info("/board/verifyBoard [GET]");
		}
			

}
