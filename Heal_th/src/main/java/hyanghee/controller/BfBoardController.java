package hyanghee.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hyanghee.dto.Board;
import hyanghee.service.face.BoardService;


@Controller
public class BfBoardController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
			
	//서비스 객체
	@Autowired private BoardService boardService;	
	
	
	@RequestMapping("/board/bfBoard")
	public void main() {
		
		logger.info("/board/bfBoard");
		
	}
	
	
	//게시글 작성 폼
//	@RequestMapping("/board/bf_write")
//	public void bf_write() {
//		
//		logger.info("/board/bf_write");
//		
//	}
	
	//게시글 작성 성공 (insert 완료)
	@RequestMapping("/board/bf_write")
	public String insertBfBoard(Board board) {
		
		boardService.insertBfBoard(board);
		
		return "redirect:/board/bfBoard";
	}
	

	   /** 게시판 - 작성 페이지 이동 */
//    @RequestMapping("/board/bf_write")
//    public String boardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
//        
//        return "board/boardWrite";
//    }
    
//    /** 게시판 - 등록 */
//    @RequestMapping("/board/bf_write")
//    public Board insertBoard(HttpServletRequest request, HttpServletResponse response, bfForm bfForm) throws Exception{
//        
//        Board boardDto = boardService.insertBoard(bfForm);
//        
//        return boardDto;
//    }
    
//    /** 게시판 - 삭제 */
//    @RequestMapping( value = "/deleteBoard")
//    public Board deleteBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
//        
//        Board board = boardService.deleteBoard(boardForm);
//        
//        return board;
//    }
//    
//    /** 게시판 - 수정 페이지 이동 */
//    @RequestMapping( value = "/boardUpdate")
//    public String boardUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception{
//        
//        return "board/boardUpdate";
//    }
//    
//    /** 게시판 - 수정 */
//    @RequestMapping( value = "/updateBoard")
//    public Board updateBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
//        
//        Board board = boardService.updateBoard(boardForm);
//        
//        return board;
//    }

	
//	//게시글 삭제
//	@RequestMapping("/board/bfDelete")
//	public String bfDelete(int id, Model model) {
//		
////		Board board = BoardService.findArticleByNickname(nickName)
//		
//		Map<String, Object> rs = boardService.deleteBfArticle(id);
//		
//		model.addAttribute("alertMsg", rs.get("msg"));
//		model.addAttribute("redirectUrl", "/board/bfBoard?writer=" + writer);
//		
//		boardService.deleteBfArticle(id);
//	}
	
	
	
	

}
