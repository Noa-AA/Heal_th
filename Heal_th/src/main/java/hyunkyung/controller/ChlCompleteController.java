package hyunkyung.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlCompleteService;

@Controller
public class ChlCompleteController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChlCompleteService chlCompleteService;
	

	@GetMapping("/challenge/complete")
	public void complete(Challenge challenge, Model model) {
		logger.info("/challenge/complete [GET]");
		
	}
	
	@PostMapping("/challenge/complete")
	public void completeProc(Challenge challenge, Model model) {
		logger.info("/challenge/complete [POST]");
	
	
	}
	
}
