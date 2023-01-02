package hyanghee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import hyanghee.dto.DietBoard;
import hyanghee.service.face.DietBoardService;
import hyanghee.util.BoardPageMaker;
import hyanghee.util.BoardSearch;
import jucheol.dto.Comment;
import jucheol.dto.Fileupload;
import jucheol.service.face.FileuploadService;
import saebyeol.dto.Notice;
import yerim.dto.Users;

@Controller
public class DietBoardController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
				
	//서비스 객체
	@Autowired private DietBoardService dietBoardService;
	
	//첨부 파일
	@Autowired private FileuploadService fileuploadService; 
		
	//게시글 리스트
	@RequestMapping("/board/dietBoard")
	public void list(BoardSearch boardSearch, HttpSession session, Model model) {
		
		//공지사항
		List<Notice> notice = dietBoardService.notice(boardSearch);
		for( Notice n : notice )	logger.info("{}", n);
		model.addAttribute("notice", notice);
		
		//검색
		List<DietBoard> list = dietBoardService.getSearchPaging(boardSearch);
		
		model.addAttribute("boardSearch", list);
		int total = dietBoardService.getTotal(boardSearch);
		
		//게시글 목록 첨부파일
		List<Map<String,Object>> fileMapList = new ArrayList<>();
		for( DietBoard b : list ) {
			logger.info("{}", b);
					
			Map<String,Object> fileMap = new HashMap<>();

			fileMap.put("dietNo", b.getDietNo());
					
			Fileupload f = new Fileupload();
			f.setBoardNo(b.getDietNo());
			f.setCategoryNo(3);
			fileMap.put("fileList", fileuploadService.getFileList(f));
					
			fileMapList.add(fileMap);
		}
		model.addAttribute("fileMapList", fileMapList);
		
		BoardPageMaker pageMake = new BoardPageMaker(boardSearch, total);
		logger.info("{}", pageMake);
		model.addAttribute("pageMaker", pageMake);

	}
		
		
		
	//게시글 작성
	@GetMapping("/board/dWrite")
	public String insertBfBoard(HttpSession session, Model model) {
		logger.info("/board/dWrite [GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			Users users = dietBoardService.getUserInfo(userno);
			logger.info("userInfo : {}", users);
			model.addAttribute("users", users);
			
			int point = dietBoardService.getPoint(userno);
			logger.info("point: {}", point);
			model.addAttribute("point", point);
			
			return "/board/dWrite";
		} else {
			return "/login/login";
		}

		
	}
		
	@PostMapping("/board/dWrite")
	public String insertBoardProc(DietBoard dietBoard,HttpSession session
			, List<MultipartFile> multiFile
			) {
		
		//테스트용 로그인 userno
		session.setAttribute("userNo", 7777);
			
		//작성자, 카테고리 정보 추가
		dietBoard.setUserNo( (int) session.getAttribute("userNo") );
				
		logger.info("{}", dietBoard);
				
		dietBoardService.insertDietBoard(dietBoard);
		
		 int boardNo = dietBoard.getDietNo();
	     int categoryNo = 3;
	     fileuploadService.insertFile(multiFile, boardNo, categoryNo);
		
		int point = (Integer)session.getAttribute("userNo");
		dietBoardService.updatePoint(point);
			
		return "redirect:/board/dietBoard";
		
	}
		
		//게시글 상세 보기
		@RequestMapping("board/dView")
		public String view(DietBoard viewBoard, Comment comment, Model model) {
			logger.info("{}", viewBoard);
			
			//잘못된 게시글 번호 처리
			if( viewBoard.getDietNo() < 0 ) {
				return "redirect:/board/dietBoard";
			}
			
			//게시글 조회
			viewBoard = dietBoardService.view(viewBoard);
			logger.info("조회된 게시글 {}", viewBoard);
			
			//모델값 전달
			model.addAttribute("viewBoard", viewBoard);
			model.addAttribute("comment", comment);
			model.addAttribute("boardNo", viewBoard.getDietNo());
			
			return "board/dView";
		}

		//게시글 수정
		@GetMapping("/board/dUpdate")
		public String update(DietBoard dietBoard, Model model) {
			logger.debug("{}", dietBoard);
			
			//잘못된 게시글 번호 처리
			if( dietBoard.getDietNo() < 0 ) {
				return "redirect:/board/dietBoard";
			}
			
			//게시글 조회
			dietBoard = dietBoardService.view(dietBoard);
			logger.debug("조회된 게시글 {}", dietBoard);
			
			//첨부파일
			int boardNo = dietBoard.getDietNo(); 
	        int categoryNo = 3;
	        model.addAttribute("boardNo", boardNo);
	        model.addAttribute("categoryNo", categoryNo);
			
			//모델값 전달
			model.addAttribute("updateBoard", dietBoard);
			
			
			return "/board/dUpdate";

		}
		

		
		@PostMapping("/board/dUpdate")
		public String updateProcess(DietBoard dietBoard, Model model
				, List<MultipartFile> multiFile) {
			logger.debug("{}", dietBoard);
			
			int boardNo = dietBoard.getDietNo();
			int categoryNo = 3;
			fileuploadService.updateFile(multiFile,boardNo,categoryNo);
			
			
			dietBoardService.update(dietBoard);
			
			return "redirect:/board/dView?dietNo=" + dietBoard.getDietNo();
		}
		
		
		//게시글 삭제
		@RequestMapping("/board/dDelete")
		public String delete(DietBoard dietNo) {
			
			logger.info("{}", dietNo);
			
			dietBoardService.delete(dietNo);
			
			
			return "redirect:/board/dietBoard";
		}
		
		
		
}
