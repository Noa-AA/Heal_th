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

import hyanghee.dto.ReviewBoard;
import hyanghee.service.face.ReviewBoardService;
import hyanghee.util.BoardPageMaker;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import jucheol.dto.Comment;
import jucheol.service.face.FileuploadService;
import saebyeol.dto.Notice;
import yerim.dto.Users;

@Controller
public class ReviewBoardController {
	
	//로그 객체
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
				
		//서비스 객체
		@Autowired private ReviewBoardService reviewBoardService;
		
		//첨부 파일
		@Autowired private FileuploadService fileuploadService; 
		
		
		//게시글 리스트
		@RequestMapping("/board/reviewBoard")
		public void list(Model model, BoardSearch boardSearch) {
			
			List<Notice> notice = reviewBoardService.notice(boardSearch);
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
		public String insertBoard(HttpSession session, Model model) {
			logger.info("/board/rWrite [GET]");
			
			if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
				int userno = (int) session.getAttribute("userNo");
				logger.info("userno : {}", userno);
				
				Users users = reviewBoardService.getUserInfo(userno);
				logger.info("userInfo : {}", users);
				model.addAttribute("users", users);
				
				int point = reviewBoardService.getPoint(userno);
				logger.info("point: {}", point);
				model.addAttribute("point", point);
				
				return "/board/rWrite";
			} else {
				return "/login/login";
			}

		}
		
		@PostMapping("/board/rWrite")
		public String insertReviewProc(ReviewBoard reviewBoard,HttpSession session
				, List<MultipartFile> multiFile
				) {
			
			//테스트용 로그인 userno
			//session.setAttribute("userNo", 7777);
			
			//작성자, 카테고리 정보 추가
			reviewBoard.setUserNo( (int) session.getAttribute("userNo") );
			
			logger.info("{}", reviewBoard);
			
			reviewBoardService.insertReview(reviewBoard);
			
			 int boardNo = reviewBoard.getReviewNo(); //----------------1 대신 해당게시판 글번호 넣어주세여 ex) bfBoard.getBfNo()
		     int categoryNo = 4;//----------------카테고리번호 넣어주세여~
		     fileuploadService.insertFile(multiFile, boardNo, categoryNo);
			
			int point = (Integer)session.getAttribute("userNo");
			reviewBoardService.updatePoint(point);
			
			return "redirect:/board/reviewBoard";
		}
		
		//게시글 상세 보기
		@RequestMapping("board/rView")
		public String view(ReviewBoard viewBoard, Comment comment, Model model) {
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
			model.addAttribute("comment", comment);
			model.addAttribute("boardNo", viewBoard.getReviewNo());
			
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
