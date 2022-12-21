package jucheol.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hyanghee.dto.DietBoard;

@Controller
public class testController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@GetMapping("/check/main")
	public void checkmain() {
		logger.info("check/main[get]");
	}
	
	@GetMapping("/addOns/test")
	public void addontest(
			Model model
			, DietBoard viewBoard
			) {
		logger.info("addontest");
		
		viewBoard.setCategoryNo(4);
		model.addAttribute("boardNo", 2);
		model.addAttribute("viewBoard", viewBoard);
	}
}
