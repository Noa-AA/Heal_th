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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hyanghee.dto.Beforeafter;
import hyanghee.service.face.BfBoardService;
import hyanghee.util.BoardPaging;
import jucheol.dto.Comment;
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
			, Model model ) {
		
		BoardPaging boardPaging = bfBoardService.getPaging(curPage);
		logger.info("{}", boardPaging);
		model.addAttribute("BoardPaging", boardPaging);
		
		List<Beforeafter> list = bfBoardService.list(boardPaging);
		for( Beforeafter b : list )	logger.info("{}", b);
		model.addAttribute("list", list);
		
	}
	
	
	
	//게시글 작성
	@GetMapping("/board/bfWrite")
	public void insertBfBoard() {
		
		logger.info("/board/bfWrite [GET]");

	}
	
	@PostMapping("/board/bfWrite")
	public String insertBfBoardProc(Beforeafter bfBoard,HttpSession session) {
		
		//테스트용 로그인 userno
		session.setAttribute("userNo", 7777);
		
		//작성자, 카테고리 정보 추가
		bfBoard.setUserNo( (int) session.getAttribute("userNo") );
//		bfBoard.setCategoryNo( (int) session.getAttribute("categoryNo") );
		
		logger.info("{}", bfBoard);
		
		bfBoardService.insertBfBoard(bfBoard);
		
		return "redirect:/board/bfBoard";
	}
	
	//게시글 상세 보기
	@RequestMapping("board/bfView")
	public String view(Beforeafter viewBoard, Model model) {
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
		
		return "board/bfView";
	}

	//게시글 수정
	@GetMapping("/board/bfUpdate")
	public String update(Beforeafter beforeafter, Comment comment, Model model) {
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
		model.addAttribute("comment", comment);
		
		//댓글 정보 추가
		
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

	
	//포인트
	
}



