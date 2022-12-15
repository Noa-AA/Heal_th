package hyunkyung.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlCreateService;

@Controller
public class ChlCreateController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChlCreateService createService;

	// 챌린지 만들기 폼
	@GetMapping("/challenge/create")
	public void create() {
		logger.info("/challenge/create [GET]");
	}

	// 챌린지 만들기 처리
	@PostMapping("/challenge/create")
	public String createProc(Challenge challenge/*, RedirectAttributes rttr*/) {
		logger.info("/challenge/create [POST]");
		logger.info("[post] challenge :{}", challenge);
		
		createService.create(challenge);
		
		//알림창 실행위해서
//		rttr.addFlashAttribute("result", "create success");
		return "redirect:/challenge/list";
	}


	


}
