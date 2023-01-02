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
import org.springframework.web.bind.annotation.RequestParam;

import jucheol.dto.Scrap;
import jucheol.service.face.ScrapService;
import jucheol.util.Infinity;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ScrapService scrapService;
	

	@GetMapping("/scrap")
	public void scrap(
			HttpSession session
			, Infinity infinity
			,@RequestParam(defaultValue = "0") int endNo
			, Model model
			) {
		logger.info("/scrap/scrap[GET]");
//		logger.info("endNo---{}",endNo);
//
//		infinity = scrapService.getList(endNo+1);
//		infinity.setUserNo((int) session.getAttribute("userNo"));
//		
//		List<Scrap> scrapList = scrapService.selectList(infinity);
//		for( Scrap s : scrapList )logger.info("scrapList {}",s);
//		
//		endNo = scrapList.get(scrapList.size() - 1).getCurpage();
//		
//		logger.info("endNo-----{}",endNo);
//
		session.setAttribute("scrapEndNo", endNo);
//		model.addAttribute("scrapList", scrapList);
	}
	
	@GetMapping("/addlist")
	public void scrapAddList(
			HttpSession session	
			, Model model
			) {
		logger.info("/scrap/list[GET]");

		int endNo = (int) session.getAttribute("scrapEndNo");
		logger.info("lastNo- {} : ",endNo);
		
		Infinity infinity = scrapService.getList(endNo+1);

		infinity.setUserNo((int) session.getAttribute("userNo"));
		logger.info("infinity-{}",infinity);
		
		scrapService.selectList(infinity);
		
		List<Scrap> scrapList = scrapService.selectList(infinity);
		if(scrapList.size() > 0 ) {
			System.out.println(scrapList);
			for( Scrap s : scrapList )logger.info("scrapList {}",s);
			
			endNo = scrapList.get(scrapList.size() - 1).getCurpage();
			logger.info("endNo?====={}",endNo);

			session.setAttribute("scrapEndNo", endNo);
			
			logger.info("scrapSession - {}",session.getAttribute("scrapEndNo"));
			
			model.addAttribute("scrapList", scrapList);
			model.addAttribute("scrapEmpty", true);
		} else {
			model.addAttribute("scrapEmpty", false);
			
		}
		
		
		//-----------테스트용 유저삽입
//		session.setAttribute("userNo", 7777);
		
//		scrap.setUserNo((int) session.getAttribute("userNo"));	1~
//		
//		List<Scrap> scrapList = scrapService.selectList(scrap);
//		for( Scrap s : scrapList )logger.info("scrapList {}",s);
//		
//		
//		model.addAttribute("scrapList", scrapList);	~1
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
		logger.info("scrap-{}",scrap);
		scrapService.addScrap(scrap);
		
		model.addAttribute("scrap", scrap);
		
		return "scrap/scrapAdd";
		
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
