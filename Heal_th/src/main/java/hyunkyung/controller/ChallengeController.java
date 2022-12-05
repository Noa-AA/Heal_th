package hyunkyung.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChallengeService;
import hyunkyung.util.Paging;

@Controller
public class ChallengeController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChallengeService challengeService;

	// 챌린지 리스트
	@RequestMapping("/challenge/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model) {
		logger.info("/challenge/list");

		Paging paging = challengeService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);

		List<Challenge> list = challengeService.list(paging);
		for (Challenge c : list)
			logger.info("{}", c);
		model.addAttribute("list", list);
	}

	// 챌린지 상세페이지 이동
	@RequestMapping("/challenge/view")
	public String view(Challenge viewChallenge, Model model) {
		logger.info("challenge/view - {}", viewChallenge);

		// 잘못된 챌린지 번호 처리
		if (viewChallenge.getChallengeNo() < 0) {
			return "redirect:/challenge/list";
		}

		// 챌린지 조회
		viewChallenge = challengeService.view(viewChallenge);
		logger.info("조회된 챌린지 {}", viewChallenge);

		// 모델값 전달
		model.addAttribute("viewChallenge", viewChallenge);
		return "challenge/view";
	}

	// 챌린지 가입 폼
	@GetMapping("/challenge/join")
	public void join() {
		logger.info("challenge/join [GET]");
	}

	// 챌린지 가입 처리
	@PostMapping("/challenge/join")
	public void joinProc() {
		logger.info("challenge/join [POST]");
	}

}
