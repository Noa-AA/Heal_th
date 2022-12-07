package common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/main")
	public String main() {
		logger.info("/main");
		
		return("redirect:/chat/chatRoom");
	}
	
}
