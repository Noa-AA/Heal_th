package hyunkyung.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.CreateService;

@Controller
public class CreateController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CreateService createService;

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
	public String createProc(Challenge challenge) {
		logger.info("/challenge/create [POST]");
		logger.info("{}", challenge);

		createService.create(challenge);

		return "redirect:/challenge/list";
	}

}
