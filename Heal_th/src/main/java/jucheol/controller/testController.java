package jucheol.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hyanghee.dto.DietBoard;
import jucheol.dto.Fileupload;
import jucheol.service.face.FileuploadService;

@Controller
public class testController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private FileuploadService fileuploadService;
	
	@GetMapping("/check/main")
	public void checkmain() {
		logger.info("check/main[get]");
	}
	
	@GetMapping("/addOns/viewtest")
	public void addontest(
			Model model
			, DietBoard viewBoard
			,Fileupload fileupload
			) {
		logger.info("addontest");
		
		viewBoard.setCategoryNo(2);
		model.addAttribute("boardNo", 3);
		model.addAttribute("viewBoard", viewBoard);
		
	}
}
