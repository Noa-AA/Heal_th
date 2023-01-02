package jucheol.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hyanghee.dto.DietBoard;

@Controller
public class AddOnsController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/addOns/addOn")
	public void scrapTest() {
		logger.info("/addOns/addOn[GET]");
	}
	
	

}
