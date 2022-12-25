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

import hyanghee.dto.VerifyBoard;
import hyanghee.service.face.VerifyBoardService;
import hyanghee.util.BoardPageMaker;
import hyanghee.util.BoardSearch;
import jucheol.dto.Comment;
import saebyeol.dto.Notice;
import yerim.dto.Users;

@Controller
public class VerifyBoardController {
	

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private VerifyBoardService verifyBoardService;	
	
	//운동인증 게시판 목록
	@RequestMapping("board/verifyBoard")
	public void list(BoardSearch boardSearch, Model model ) {
		
		//공지사항
		List<Notice> notice = verifyBoardService.notice(boardSearch);
		for( Notice n : notice )	logger.info("{}", n);
		model.addAttribute("notice", notice);
		
		//검색
		model.addAttribute("boardSearch", verifyBoardService.getSearchPaging(boardSearch));
		int total = verifyBoardService.getTotal(boardSearch);
		
		BoardPageMaker pageMake = new BoardPageMaker(boardSearch, total);
		model.addAttribute("pageMaker", pageMake);

	}
	

	//게시글 작성
	@GetMapping("/board/vWrite")
	public String insertVerifyBoard(HttpSession session, Model model) {
		logger.info("/board/vWrite [GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			Users users = verifyBoardService.getUserInfo(userno);
			logger.info("userInfo : {}", users);
			model.addAttribute("users", users);
			
			int point = verifyBoardService.getPoint(userno);
			logger.info("point: {}", point);
			model.addAttribute("point", point);
			
			return "/board/vWrite";
		} else {
			return "/login/login";
		}
		
	}
	
	@PostMapping("/board/vWrite")
	public String insertVerifyBoardProc(VerifyBoard verifyBoard,HttpSession session) {
		
		//테스트용 로그인 userno
		//session.setAttribute("userNo", 7777);
		
		//작성자, 카테고리 정보 추가
		verifyBoard.setUserNo( (int) session.getAttribute("userNo") );
//		bfBoard.setCategoryNo( (int) session.getAttribute("categoryNo") );
		
		logger.info("{}", verifyBoard);
		
		verifyBoardService.insertVerifyBoard(verifyBoard);
		
		int point = (Integer)session.getAttribute("userNo");
		verifyBoardService.updatePoint(point);
		
		return "redirect:/board/verifyBoard";
	}
	
	//게시글 상세 보기
	@RequestMapping("board/verifyView")
	public String view(VerifyBoard viewBoard, Comment comment, Model model) {
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
		model.addAttribute("comment", comment);
		model.addAttribute("boardNo", viewBoard.getVerifyNo());
		
		return "/board/verifyView";
	}

	//게시글 수정
	@GetMapping("/board/vUpdate")
	public String update(VerifyBoard verifyBoard, Model model) {
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

