package hyanghee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import hyanghee.dto.SearchDto;
import hyanghee.service.face.BfBoardService;
import hyanghee.service.face.SearchService;
import hyanghee.util.BoardPaging;
import hyanghee.util.BoardSearch;
import jucheol.dto.Comment;
import yerim.dto.Users;


@Controller
public class BfBoardController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
			
	//서비스 객체
	@Autowired private BfBoardService bfBoardService;	
	@Autowired private SearchService searchService;
	
	
	//게시글 리스트 + 검색
	@RequestMapping("/board/bfBoard")
	public void list(
			@RequestParam(defaultValue = "1") int curPage
			, Model model) {
		
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
	
	
	
	//게시글 검색
//	@GetMapping("/board/bfBoard")
//	public void search(Model model, BoardSearch boardSearch) {
//		
//		model.addAttribute("bfBoard", bfBoardService.getSearchPaging(boardSearch));
//		
//		int total = bfBoardService.getTotal(boardSearch);
//		
//		
//	}
	

	
	//검색
//	@RequestMapping("/board/search")
//	public ModelAndView list(
//            
//			@RequestParam(defaultValue="1") int curPage,
// 
//            @RequestParam(defaultValue="userNo") int search_option, //기본 검색 옵션값을 작성자로 한다.
// 
//            @RequestParam(defaultValue="") String keyword //키워드의 기본값을 ""으로 한다.
// 
//            )
//             throws Exception{
//        
//        //레코드 갯수를 계산
//        int count = 1000;
//        
//        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
//        BoardPaging pager = new BoardPaging(curPage);
//        int start = pager.getStartNo();
//        int end =  pager.getEndNo();
//             
//        //map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
//        List<SearchDto> list = searchService.listAll(search_option, keyword, start, end);
//        
//        ModelAndView mav = new ModelAndView();
//        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
//        
//        map.put("list", list);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
//        map.put("pager", pager);
//        map.put("count", count);
//        map.put("search_option", search_option);
//        map.put("keyword", keyword);
//        mav.addObject("map", map);                    //modelandview에 map를 저장
//        
//        System.out.println("map : "+map);
//        mav.setViewName("board/searchView");                //자료를 넘길 뷰의 이름
//        
//        return mav;    //게시판 페이지로 이동
//    
//    }

	
	
	
	
	//리스트
//	@RequestMapping("/board/bfBoard")
//	public void list(
//			@RequestParam(defaultValue = "0") int curPage
//			, Model model ) {
//		
//		BoardPaging boardPaging = bfBoardService.getPaging(curPage);
//		logger.info("{}", boardPaging);
//		model.addAttribute("BoardPaging", boardPaging);
//		
//		List<Beforeafter> list = bfBoardService.list(boardPaging);
//		for( Beforeafter b : list )	logger.info("{}", b);
//		model.addAttribute("list", list);
//		
//	}
	
	
}



