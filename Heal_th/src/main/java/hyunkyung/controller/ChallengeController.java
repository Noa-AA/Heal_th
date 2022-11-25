package hyunkyung.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hyunkyung.service.face.ChallengeService;

@Controller
public class ChallengeController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ChallengeService challengeService;
	
	@RequestMapping("/challenge/list")
	public void main() {
		logger.info("/challenge/list");
	}

}
