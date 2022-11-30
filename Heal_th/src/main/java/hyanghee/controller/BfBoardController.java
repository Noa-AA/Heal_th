package hyanghee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hyanghee.dto.Beforeafter;
import hyanghee.service.face.BfBoardService;
import hyanghee.util.BoardPaging;
import yerim.dto.Users;
import yerim.service.face.LoginService;


@Controller
public class BfBoardController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
			
	//서비스 객체
	@Autowired private BfBoardService bfBoardService;	
	
	@Autowired private LoginService loginService;
	
	
	//게시글 리스트
	@RequestMapping("/board/bfBoard")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		BoardPaging boardPaging = bfBoardService.getPaging(curPage);
		logger.info("{}", boardPaging);
		model.addAttribute("BoardPaging", boardPaging);
		
		List<Beforeafter> list = bfBoardService.list(boardPaging);
		for( Beforeafter b : list )	logger.info("{}", b);
		model.addAttribute("list", list);
		
	}
	

	//로그인 화면
//	@GetMapping("/login/login")
//	public ModelAndView index(RedirectAttributes redirect) {
//		
//		ModelAndView mv = new ModelAndView("/login/login");
//		if(redirect.getAttribute("msg") != null ) {
//			mv.addObject("msg", redirect.getAttribute("msg"));
//		}
//		
//	
//	 }
//	
//	@PostMapping("/login/login")
//	
	

	
	
	
	//게시글 작성
	@GetMapping("/board/bf_write")
	public void insertBfBoard() {	}
	
	@PostMapping("/board/bf_write")
	public String insertBfBoardProc(Beforeafter bfBoard, Model model, HttpSession session) {
		
		logger.info("/board/bfBoard [GET]");

		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		Users user = bfBoardService.getUserInfo(userno);
		logger.info("userInfo : {}", user);
		model.addAttribute("user", user);
		
		
		//작성자, 카테고리 정보 추가
		bfBoard.setUserNo( (int) session.getAttribute("userNo") );
		bfBoard.setCategoryNo( (int) session.getAttribute("categoryNo") );
		
		bfBoardService.insertBfBoard(bfBoard);
		
		return "redirect:/board/bfBoard";
	}


	
//	@RequestMapping(value = "/bfBoard", method = RequestMethod.GET)
//	public String bfBoardView(Model model, HttpSession session) {
//		logger.info("/board/bfBoard [GET]");
//
//		session.setAttribute("userno", 7777);
//		int userno = (int) session.getAttribute("userno");
//		logger.info("userno : {}", userno);
//		
//		Users user = bfBoardService.getUserInfo(userno);
//		logger.info("userInfo : {}", user);
//		model.addAttribute("user", user);
//		
//		
//		return "/board/bfBoard";
//	}
	
//	@RequestMapping(value = "/board/bf_write", method = RequestMethod.POST)
//	public String insertBfBoard(BfBoard bfBoard) {
//		logger.info("/board/bf_write [POST]");
//		
//		logger.info("bfBoard : {} ", bfBoard);
//		
//		bfBoardService.insertBfBoard(bfBoard);
//		
//		return "redirect:/board/bfBoard";
//		
//	}

}



