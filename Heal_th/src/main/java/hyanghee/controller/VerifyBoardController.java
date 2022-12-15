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

import hyanghee.dto.VerifyBoard;
import hyanghee.service.face.VerifyBoardService;
import hyanghee.util.BoardPaging;
import jucheol.dto.Comment;

@Controller
public class VerifyBoardController {
	

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private VerifyBoardService verifyBoardService;	
	
	//운동인증 게시판 목록
	@RequestMapping("board/verifyBoard")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		BoardPaging boardPaging = verifyBoardService.getPaging(curPage);
		logger.debug("{}", boardPaging);
		model.addAttribute("boardPaging", boardPaging);
		
		List<VerifyBoard> list = verifyBoardService.list(boardPaging);
		for( VerifyBoard v : list )	logger.debug("{}", v);
		model.addAttribute("list", list);

	}
	

	//게시글 작성
	@GetMapping("/board/vWrite")
	public void insertVerifyBoard() {
		
		logger.info("/board/vWrite [GET]");

	}
	
	@PostMapping("/board/vWrite")
	public String insertVerifyBoardProc(VerifyBoard verifyBoard,HttpSession session) {
		
		//테스트용 로그인 userno
		session.setAttribute("userNo", 7777);
		
		//작성자, 카테고리 정보 추가
		verifyBoard.setUserNo( (int) session.getAttribute("userNo") );
//		bfBoard.setCategoryNo( (int) session.getAttribute("categoryNo") );
		
		logger.info("{}", verifyBoard);
		
		verifyBoardService.insertVerifyBoard(verifyBoard);
		
		return "redirect:/board/verifyBoard";
	}
	
	//게시글 상세 보기
	@RequestMapping("board/verifyView")
	public String view(VerifyBoard viewBoard, Model model) {
		logger.info("{}", viewBoard);
		
		//잘못된 게시글 번호 처리
		if( viewBoard.getVerifyNo() < 0 ) {
			return "redirect:/board/verifyBoard";
		}
		
		//게시글 조회
		viewBoard = verifyBoardService.view(viewBoard);
		logger.info("조회된 게시글 {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		return "/board/verifyView";
	}

	//게시글 수정
	@GetMapping("/board/vUpdate")
	public String update(VerifyBoard verifyBoard, Comment comment, Model model) {
		logger.debug("{}", verifyBoard);
		
		//잘못된 게시글 번호 처리
		if( verifyBoard.getVerifyNo() < 0 ) {
			return "redirect:/board/verifyBoard";
		}
		
		//게시글 조회
		verifyBoard= verifyBoardService.view(verifyBoard);
		logger.debug("조회된 게시글 {}", verifyBoard);
		
		//모델값 전달
		model.addAttribute("updateBoard", verifyBoard);
		model.addAttribute("comment", comment);
		
		//첨부파일 모델값 전달
//		BoardFile boardFile = boardService.getAttachFile(beforeafter);
//		model.addAttribute("boardFile", boardFile);
		
		
		return "/board/vUpdate";

	}
	

	
	@PostMapping("/board/vUpdate")
	public String updateProcess(VerifyBoard verifyBoard) {
		logger.debug("{}", verifyBoard);
		
		verifyBoardService.update(verifyBoard);
		
		return "redirect:/board/verifyView?verifyNo=" + verifyBoard.getVerifyNo();
	}
	
	
	//게시글 삭제
	@RequestMapping("/board/vDelete")
	public String delete(VerifyBoard verifyNo) {
		
		logger.info("{}", verifyNo);
		
		verifyBoardService.delete(verifyNo);
		
		
		return "redirect:/board/verifyBoard";
	}
	
	
}

