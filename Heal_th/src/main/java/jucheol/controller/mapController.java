package jucheol.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class mapController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	    
	@GetMapping("/find")
	public void findMap() {
		logger.info("/map [GET]");
	}
}
