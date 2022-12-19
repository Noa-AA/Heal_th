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

import hyanghee.dto.ReviewBoard;
import hyanghee.service.face.ReviewBoardService;
import hyanghee.util.BoardPageMaker;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;

@Controller
public class ReviewBoardController {
	
	//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
				
		//서비스 객체
		@Autowired private ReviewBoardService reviewBoardService;	
		
		
		//게시글 리스트
		@RequestMapping("/board/reviewBoard")
		public void list(
				@RequestParam(defaultValue = "0") int curPage
				, Model model, BoardSearch boardSearch ) {
			
			BoardPaging boardPaging = reviewBoardService.getPaging(curPage);
			logger.info("{}", boardPaging);
			model.addAttribute("BoardPaging", boardPaging);
			
			List<Notice> notice = reviewBoardService.notice(boardPaging);
			for( Notice n : notice )	logger.info("{}", n);
			model.addAttribute("notice", notice);
			
			//검색
			model.addAttribute("boardSearch", reviewBoardService.getSearchPaging(boardSearch));
			int total = reviewBoardService.getTotal(boardSearch);
			
			BoardPageMaker pageMake = new BoardPageMaker(boardSearch, total);
			model.addAttribute("pageMaker", pageMake);
			
		}
		

		
		//게시글 작성
		@GetMapping("/board/rWrite")
		public void insertBoard() {
			
			logger.info("/board/rWrite [GET]");

		}
		
		@PostMapping("/board/rWrite")
		public String insertReviewProc(ReviewBoard reviewBoard,HttpSession session) {
			
			//테스트용 로그인 userno
			session.setAttribute("userNo", 7777);
			
			//작성자, 카테고리 정보 추가
			reviewBoard.setUserNo( (int) session.getAttribute("userNo") );
//			bfBoard.setCategoryNo( (int) session.getAttribute("categoryNo") );
			
			logger.info("{}", reviewBoard);
			
			reviewBoardService.insertReview(reviewBoard);
			
			return "redirect:/board/reviewBoard";
		}
		
		//게시글 상세 보기
		@RequestMapping("board/rView")
		public String view(ReviewBoard viewBoard, Model model) {
			logger.info("{}", viewBoard);
			
			//잘못된 게시글 번호 처리
			if( viewBoard.getReviewNo() < 0 ) {
				return "redirect:/board/reviewBoard";
			}
			
			//게시글 조회
			viewBoard = reviewBoardService.view(viewBoard);
			logger.info("조회된 게시글 {}", viewBoard);
			
			//모델값 전달
			model.addAttribute("viewBoard", viewBoard);
			
			return "board/rView";
		}

		//게시글 수정
		@GetMapping("/board/rUpdate")
		public String update(ReviewBoard reviewBoard, Model model) {
			logger.debug("{}", reviewBoard);
			
			//잘못된 게시글 번호 처리
			if( reviewBoard.getReviewNo() < 0 ) {
				return "redirect:/board/reviewBoard";
			}
			
			//게시글 조회
			reviewBoard = reviewBoardService.view(reviewBoard);
			logger.debug("조회된 게시글 {}", reviewBoard);
			
			//모델값 전달
			model.addAttribute("updateBoard", reviewBoard);
			
			
			//첨부파일 모델값 전달
//			BoardFile boardFile = boardService.getAttachFile(beforeafter);
//			model.addAttribute("boardFile", boardFile);
			
			
			return "/board/rUpdate";

		}
		

		
		@PostMapping("/board/rUpdate")
		public String updateProcess(ReviewBoard reviewBoard) {
			logger.debug("{}", reviewBoard);
			
			reviewBoardService.update(reviewBoard);
			
			return "redirect:/board/rView?reviewNo=" + reviewBoard.getReviewNo();
		}
		
		
		//게시글 삭제
		@RequestMapping("/board/rDelete")
		public String delete(ReviewBoard reviewNo) {
			
			logger.info("{}", reviewNo);
			
			reviewBoardService.delete(reviewNo);
			
			
			return "redirect:/board/reviewBoard";
		}

		
		//포인트

}
