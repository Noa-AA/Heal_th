package common;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import daeyeon.service.face.ChatService;
import yerim.dto.Users;

@Controller
public class MainController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ChatService chatService;
	
	@RequestMapping("/main")
	public void main( Model model, Users users ) {
		logger.info("/main");
		
		//포인트가 제일 높은 회원 조회
		List<Users> topUserList = chatService.topUserList();
		
		logger.info("topUserList : {}", topUserList);
		
		model.addAttribute("topUserList", topUserList);
		
	}
	
}
