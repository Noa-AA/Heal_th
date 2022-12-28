package jucheol.controller;

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

import jucheol.dto.Scrap;
import jucheol.service.face.ScrapService;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ScrapService scrapService;
	
	
	
	@GetMapping("/scrap")
	public void scrap() {
		logger.info("/scrap/scrap[GET]");
	}
	@PostMapping("/add")
	public String addScrap(
			HttpSession session
			,Scrap scrap
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/scrap/add[POST]");
		
		//-----------테스트용 유저삽입
//		session.setAttribute("userNo", 7777);
		
		scrap.setUserNo((int) session.getAttribute("userNo"));
		scrap.setBoardNo(boardno);
		scrap.setCategoryNo(category);
		
		scrapService.addScrap(scrap);
		
		model.addAttribute("scrap", scrap);
		
		return "scrap/scrapAdd";
		
	}
	
	@GetMapping("/list")
	public void scrapList(
			HttpSession session
			, Scrap scrap
			, Model model
			) {
		logger.info("/scrap/list[GET]");

		//-----------테스트용 유저삽입
//		session.setAttribute("userNo", 7777);
		
		scrap.setUserNo((int) session.getAttribute("userNo"));
		
		List<Scrap> scrapList = scrapService.selectList(scrap);
		for( Scrap s : scrapList )logger.info("scrapList {}",s);
		
		
		model.addAttribute("scrapList", scrapList);
	}
	
	@PostMapping("/delete")
	public String deleteScrap(
			Model model
			,int scrapNo
			) {
		logger.info("/scrap/delete[POST]");
		
		scrapService.deleteScrap(scrapNo);
		
		//모델값 전달
//		model.addAttribute("commentList", commentList);
		return "scrap/scrap";
		
	}
	
	@PostMapping("/check")
	public String scrapCheck(
			HttpSession session
			,Scrap scrap
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/scrap/check[POST]");
		
//		session.setAttribute("userNo", 7777);
		
		scrap.setUserNo((int) session.getAttribute("userNo"));
		scrap.setBoardNo(boardno);
		scrap.setCategoryNo(category);
		logger.info("scrapCheck111 - {}", scrap);
		
		scrap = scrapService.scrapCheck(scrap);
		
		logger.info("scrapCheck222 - {}", scrap);
		
		if(scrap == null) {
			logger.info("스크랩 없음");
			scrap = new Scrap();
			scrap.setBoardNo(boardno);
			scrap.setCategoryNo(category);
		} else {
			model.addAttribute("scrap", scrap);
			
		}
			
		
		return "scrap/scrapAdd";
	}
	
	
}
