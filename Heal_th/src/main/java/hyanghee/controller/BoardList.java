package hyanghee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardList {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@RequestMapping("/board/boardList")
	public void main() {
		logger.info("/board/boardList");
		
		
	}
	
}
