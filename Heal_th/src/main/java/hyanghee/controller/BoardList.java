package hyanghee.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyanghee.dto.Beforeafter;
import hyanghee.service.face.BfBoardService;

@Controller
public class BoardList {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
		@Autowired private BfBoardService bfBoardService;	
		
	@RequestMapping("/board/boardList")
	public void main() {
		logger.info("/board/boardList");
	}
	
	
	
	
	
	
}
