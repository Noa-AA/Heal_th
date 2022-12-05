package hyanghee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyanghee.service.face.BfBoardService;

@Controller
public class ReviewBoardController {
	
	//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
				
		//서비스 객체
		@Autowired private BfBoardService boardService;	
		
		
		@RequestMapping("/board/reviewBoard")
		public void main() {
			
			logger.info("/board/reviewBoard");
			
		}
		
		@GetMapping("/board/reviewBoard")
		public void loginForm() {
			logger.info("/board/reviewBoard [GET]");
		}
			

}
