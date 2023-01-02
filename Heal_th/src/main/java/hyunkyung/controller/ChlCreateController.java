package hyunkyung.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlCreateService;

@Controller
public class ChlCreateController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChlCreateService createService;

	// 챌린지 만들기 폼
	@GetMapping("/challenge/create")
	public String create(HttpSession session) {
		logger.info("/challenge/create [GET]");
		

		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			return "challenge/create";
		}else {
			return "/login/login";
		}
	}

	// 챌린지 만들기 처리
	@PostMapping("/challenge/create")
	public String createProc(Challenge challenge) {
		logger.info("/challenge/create [POST]");
		logger.info("[post] challenge :{}", challenge);
		
		createService.create(challenge);
		
		return "redirect:/challenge/list";
	}



	


}
