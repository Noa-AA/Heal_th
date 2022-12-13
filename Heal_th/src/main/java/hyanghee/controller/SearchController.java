package hyanghee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hyanghee.dto.SearchDto;
import hyanghee.service.face.SearchService;
import hyanghee.util.BoardPaging;

@Controller
public class SearchController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
				
	//서비스 객체
	@Autowired private SearchService searchService;
	
//	@GetMapping("/board/search")
//	@ResponseBody
//	private List<SearchDto> getSearch(@RequestParam("type") String type, 
//			@RequestParam("ketword") String keyword, Model model) throws Exception{
//		
//		SearchDto searchDto = new SearchDto();
//		searchDto.setType(type);
//		searchDto.setKeyword(keyword);
//		return searchServie.getSearch(searchDto);
//		
//		
//	}
	
	
	//검색
//		@RequestMapping("/board/search")
//		public ModelAndView list(
//	            
//				@RequestParam(defaultValue="1") int curPage,
//	 
//	            @RequestParam(defaultValue="userNo") int search_option, //기본 검색 옵션값을 작성자로 한다.
//	 
//	            @RequestParam(defaultValue="") String keyword //키워드의 기본값을 ""으로 한다.
//	 
//	            )
//	             throws Exception{
//	        
//	        //레코드 갯수를 계산
//	        int count = 1000;
//	        
//	        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
//	        BoardPaging pager = new BoardPaging(curPage);
//	        int start = pager.getStartNo();
//	        int end =  pager.getEndNo();
//	             
//	        //map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
//	        List<SearchDto> list = searchService.listAll(search_option, keyword, start, end);
//	        
//	        ModelAndView mav = new ModelAndView();
//	        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
//	        
//	        map.put("list", list);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
//	        map.put("pager", pager);
//	        map.put("count", count);
//	        map.put("search_option", search_option);
//	        map.put("keyword", keyword);
//	        mav.addObject("map", map);                    //modelandview에 map를 저장
//	        
//	        System.out.println("map : "+map);
//	        mav.setViewName("board/searchView");                //자료를 넘길 뷰의 이름
//	        
//	        return mav;    //게시판 페이지로 이동
//	    
//	    }

	
	
	
}
