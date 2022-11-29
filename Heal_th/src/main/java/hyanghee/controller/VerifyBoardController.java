package hyanghee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hyanghee.dto.Board;
import hyanghee.service.face.BoardService;
import hyanghee.util.Paging;

@Controller
public class VerifyBoardController {
	

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private BoardService boardService;	
	
	//운동인증 게시판 목록
	@RequestMapping("board/verifyBoard")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		Paging paging = boardService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
//		List<Board> list = boardService.list(paging);
//		for( Board b : list )	logger.debug("{}", b);
//		model.addAttribute("list", list);

	}
	
	//게시글 작성
//	@RequestMapping("board/bf_write")
//	public ModelAndView getBfInsert(Board board) {
//		
//		ModelAndView model = new ModelAndView("board");
//		
//		boardService.save(board);
//		
//		return "board/verifyBoard";
//	}
	

	
}

