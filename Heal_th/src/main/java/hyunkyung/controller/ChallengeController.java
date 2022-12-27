package hyunkyung.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChallengeService;
import hyunkyung.util.ChlCriteria;
import hyunkyung.util.ChlPageMakerDTO;

@Controller
@RequestMapping("/challenge")
public class ChallengeController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChallengeService challengeService;

	// 챌린지 목록 페이지 접속(페이징 처리)
	@GetMapping("/list")
	public void challengeListGET(HttpSession session, Model model, ChlCriteria cri) {
		logger.info("/challenge/list [GET]");

		model.addAttribute("list", challengeService.getListPaging(cri));

		int total = challengeService.getTotal(cri);

		ChlPageMakerDTO pageMake = new ChlPageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);

	}

	// 챌린지 상세보기
	@GetMapping("/view")
	public String challengeGetPageGET(HttpSession session, int challengeNo, Model model,
			ChlCriteria cri) {
		logger.info("/challenge/view [GET]");

		model.addAttribute("pageInfo", challengeService.getPage(challengeNo));

		model.addAttribute("cri", cri);
		return "challenge/view";

	}

	// 관리자 로그인시 챌린지 삭제
	@RequestMapping("/delete")
	public String delete(Challenge challenge) {
		challengeService.delete(challenge);

		return "redirect:/challenge/list";
	}
	
}
