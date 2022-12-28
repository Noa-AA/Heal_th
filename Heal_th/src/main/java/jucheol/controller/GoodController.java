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

import jucheol.dto.Good;
import jucheol.dto.Report;
import jucheol.service.face.GoodService;

@Controller
@RequestMapping("/good")
public class GoodController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private GoodService goodService;
	
	@GetMapping("/good")
	public void report() {
		logger.info("/good/good[GET]");
	}
	
	@PostMapping("/check")
	public String goodCheck(
			HttpSession session
			,Good good
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/good/check[POST]");
		
//		session.setAttribute("userNo", 7777);
		
		good.setUserNo((int) session.getAttribute("userNo"));
		good.setBoardNo(boardno);
		good.setCategoryNo(category);
		logger.info("goodCheck111 - {}", good);
		
		good = goodService.goodCheck(good);
		
		logger.info("goodCheck222 - {}", good);
		
		if(good == null) {
			logger.info("좋아요 이력 없음");
			good = new Good();
			good.setBoardNo(boardno);
			good.setCategoryNo(category);
		} else {
			model.addAttribute("good", good);
			
		}
			
		
		return "good/goodAdd";
	}
	
	@PostMapping("/add")
	public String addGood(
			HttpSession session
			,Good good
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/good/add[POST]");
		
		//-----------테스트용 유저삽입
//		session.setAttribute("userNo", 7777);
		
		good.setUserNo((int) session.getAttribute("userNo"));
		good.setBoardNo(boardno);
		good.setCategoryNo(category);
		
		goodService.addGood(good);
		
		model.addAttribute("good", good);
		
		return "good/goodAdd";
		
	}
	
	@PostMapping("/delete")
	public String deleteGood(
			Model model
			,int goodNo
			,Good good
			) {
		logger.info("/good/delete[POST]");
		good.setGoodNo(goodNo);
		good = goodService.selectGood(good);
		logger.info("goodNo- {}",good);
		goodService.deleteGood(good);
		
		return "good/good";
	}
}
