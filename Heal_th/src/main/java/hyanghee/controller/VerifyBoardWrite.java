package hyanghee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyanghee.dto.Board;
import hyanghee.service.face.BoardService;
import hyanghee.util.Paging;


@Controller
public class VerifyBoardWrite {
//
//	//로그 객체
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
//	
//	//서비스 객체
//	@Autowired private BoardService boardService;	
//	
//	//운동인증 게시판 목록
//	@RequestMapping("board/verifyBoard")
//	public void list(
//			@RequestParam(defaultValue = "0") int curPage
//			, Model model ) {
//		
//		Paging paging = boardService.getPaging(curPage);
//		logger.debug("{}", paging);
//		model.addAttribute("paging", paging);
//		
//		List<Board> list = boardService.list(paging);
//		for( Board b : list )	logger.debug("{}", b);
//		model.addAttribute("list", list);
		
	
//	}
	
//	@GetMapping("/board/v_write")
//	public void list() {
//		logger.info("/board/v_write [GET]");
//	}
//		
//	
//	@PostMapping("/board/v_write")
//	public void write() {
//		logger.info("/board/v_write [POST]");
//	}
		
	
	
}
