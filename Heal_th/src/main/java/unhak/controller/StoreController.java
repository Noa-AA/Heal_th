package unhak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import unhak.dto.StoreDto;
import unhak.service.face.StoreService;
import unhak.util.StorePaging;

@Controller
@RequestMapping("/store")
public class StoreController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired private StoreService storeService;
	
	
	
	
	
	//상품목록
	@GetMapping("/list") 
	public void storelist(	
			@RequestParam(defaultValue = "0") int curPage
			, Model model	
			) {
		StorePaging paging = storeService.getPaging(curPage);
		logger.info("store/list[GET]");
		
		
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<StoreDto> list = storeService.list(paging);
		for( StoreDto b : list )	logger.debug("{}", b);
		model.addAttribute("list", list);
	}


	//상품자세히보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String storeview(StoreDto viewStore,   Model model) {
		
		logger.info("{}",viewStore);
		logger.info("store/view[GET]");

		//잘못된 게시글 번호 처리
		if(viewStore.getProdNo()<0) {
			return "redirect:/store/list";
		}
		
		
		//상품 조회
		viewStore = storeService.storeview(viewStore);
		logger.info("조회된 상품{}",viewStore);
		
		//모델값 전달
		model.addAttribute("viewStore",viewStore);
		
		
		//------------------------------------------
		//첨부파일 내용 추가예정
		
		//------------------------------------------
		
		return "store/view";
	}	
	
	//장바구니 조회
	@RequestMapping(value="/cart")
	public String cartview() {
		
		
		return null;
	}
	
}
