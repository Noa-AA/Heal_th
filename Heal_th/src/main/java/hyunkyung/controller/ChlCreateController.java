package hyunkyung.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	//날짜 형태가 계속 오류나는데..
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void create() {
		logger.info("/challenge/create [GET]");
	}

	// 챌린지 만들기 처리, 로그인 추가해야함
	@PostMapping("/challenge/create")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	//RedirectAttrivbutes는 일회성 데이터 전달, 챌린지 만들고 알림창 위해서
	public String createProc(Challenge challenge, Model model, RedirectAttributes rttr) {
		logger.info("/challenge/create [POST]");
		logger.info("{}", challenge);

		rttr.addFlashAttribute("result", "create success");
		createService.create(challenge);

		return "redirect:/challenge/list";
	}

}
