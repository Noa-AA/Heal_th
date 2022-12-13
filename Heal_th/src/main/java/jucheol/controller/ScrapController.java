package jucheol.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jucheol.dto.Scrap;
import jucheol.service.face.ScrapService;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ScrapService scrapService;
	
	@GetMapping("/scrap")
	public void scrapTest() {
		logger.info("/scrap/scrap[GET]");
	}
	@PostMapping("/add")
	public void addScrap(
			HttpSession session
			,Scrap scrap
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/scrap/add[POST]");
		
		//-----------테스트용 유저삽입
		session.setAttribute("userNo", 7777);
		
		scrap.setUserNo((int) session.getAttribute("userNo"));
		scrap.setBoardNo(boardno);
		scrap.setCategoryNo(category);
		
		scrapService.addScrap(scrap);
		
		model.addAttribute("scrap", scrap);
		
	}
	
	@GetMapping("/list")
	public void scrapList(
			HttpSession session
			,Scrap scrap
			
			) {
		logger.info("/scrap/list[GET]");

		//-----------테스트용 유저삽입
		session.setAttribute("userNo", 7777);
		
		scrap.setUserNo((int) session.getAttribute("userNo"));
		
	}
	
}
