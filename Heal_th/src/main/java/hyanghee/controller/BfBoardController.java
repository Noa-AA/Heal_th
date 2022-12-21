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

import hyanghee.dto.Beforeafter;
import hyanghee.service.face.BfBoardService;
import hyanghee.util.BoardPageMaker;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import jucheol.dto.Comment;
import saebyeol.dto.Notice;
import yerim.dto.Users;


@Controller
public class BfBoardController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
			
	//서비스 객체
	@Autowired private BfBoardService bfBoardService;	
	
	//게시글 리스트 
	@RequestMapping("/board/bfBoard")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, BoardSearch boardSearch
			, Model model) {
		
		BoardPaging paging = bfBoardService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("BoardPaging", paging);
		
		//공지사항
		List<Notice> notice = bfBoardService.notice(paging);
		for( Notice n : notice )	logger.info("{}", n);
		model.addAttribute("notice", notice);
		
		//검색
		model.addAttribute("boardSearch", bfBoardService.getSearchPaging(boardSearch));
		int total = bfBoardService.getTotal(boardSearch);
		
		BoardPageMaker pageMake = new BoardPageMaker(boardSearch, total);
		model.addAttribute("pageMaker", pageMake);
		
		
	}
	
	
	
	
	//게시글 작성
	@GetMapping("/board/bfWrite")
	public String insertBfBoard(HttpSession session, Model model) {
		logger.info("/board/bfWrite [GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			Users users = bfBoardService.getUserInfo(userno);
			logger.info("userInfo : {}", users);
			model.addAttribute("users", users);
			
			int point = bfBoardService.getPoint(userno);
			logger.info("point: {}", point);
			model.addAttribute("point", point);
			
			return "/board/bfWrite";
		} else {
			return "/login/login";
		}

	}
	
	@PostMapping("/board/bfWrite")
	public String insertBfBoardProc(Beforeafter bfBoard, HttpSession session, Model model) {
		logger.info("/board/bfWrite [POST]");
		
		//테스트용 로그인 userno
//		session.setAttribute("userNo", 7777);
		
		//작성자 정보 추가
		bfBoard.setUserNo( (int) session.getAttribute("userNo") );
		
		logger.info("{}", bfBoard);
		
		bfBoardService.insertBfBoard(bfBoard);
		
		int point = (Integer)session.getAttribute("userNo");
		bfBoardService.updatePoint(point);
		
		return "redirect:/board/bfBoard";
	}
	
	//게시글 상세 보기
	@RequestMapping("board/bfView")
	public String view(Beforeafter viewBoard,Comment comment, Model model) {
		logger.info("{}", viewBoard);
		
		//잘못된 게시글 번호 처리
		if( viewBoard.getBfNo() < 0 ) {
			return "redirect:/board/bfBoard";
		}
		
		//게시글 조회
		viewBoard = bfBoardService.view(viewBoard);
		logger.info("조회된 게시글 {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		model.addAttribute("comment", comment);
		model.addAttribute("boardNo", viewBoard.getBfNo());
		
		return "/board/bfView";
	}

	//게시글 수정
	@GetMapping("/board/bfUpdate")
	public String update(Beforeafter beforeafter, Model model) {
		logger.debug("{}", beforeafter);
		
		//잘못된 게시글 번호 처리
		if( beforeafter.getBfNo() < 0 ) {
			return "redirect:/board/bfBoard";
		}
		
		//게시글 조회
		beforeafter = bfBoardService.view(beforeafter);
		logger.debug("조회된 게시글 {}", beforeafter);
		
		//모델값 전달
		model.addAttribute("updateBoard", beforeafter);
		
		//첨부파일 모델값 전달
//		BoardFile boardFile = boardService.getAttachFile(beforeafter);
//		model.addAttribute("boardFile", boardFile);
		
		
		return "/board/bfUpdate";

	}
	

	
	@PostMapping("/board/bfUpdate")
	public String updateProcess(Beforeafter beforeafter) {
		logger.debug("{}", beforeafter);
		
		bfBoardService.update(beforeafter);
		
		return "redirect:/board/bfView?bfNo=" + beforeafter.getBfNo();
	}
	
	
	//게시글 삭제
	@RequestMapping("/board/bfDelete")
	public String delete(Beforeafter bfNo) {
		
		logger.info("{}", bfNo);
		
		bfBoardService.delete(bfNo);
		
		
		return "redirect:/board/bfBoard";
	}
	
	
	
}







