package hyunkyung.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlJoinService;

@Controller
public class ChlJoinController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChlJoinService chlJoinService;

	//챌린지 가입,결제 화면
		@GetMapping("/challenge/join")
		//localhost:8888/challenge/join?challengeNo=1 로 입력할땐 에러안남
		public void join(@RequestParam(required = true) int challengeNo, Challenge challenge, Model model) {
			logger.info("challenge/join [GET]");
			model.addAttribute("challengeNo {}", challengeNo);
			logger.info("challengeNo", challengeNo);
			
			//해당 챌린지 조회
			challenge = chlJoinService.selectInfo(challenge);
			logger.info("{}", challenge);
			// 모델값 전달
			model.addAttribute("challenge", challenge);
			logger.info("챌린지 나오게 해주세요", challenge);

		}

	@GetMapping("/join/{}")
		// 챌린지 가입,결제 버튼 누를때 -> 결제완료 화면으로 넘어가는
		@PostMapping("/challenge/join")
		public String joinProc(Challenge challenge, Model model) {
			logger.info("challenge/join [POST]");

			// 여기서부터 챌린지 번호가 안찍힘
			logger.info("{}", challenge);

//			테스트용 로그인
//			session.setAttribute("userno", 7777);
//			challenge.setUserNo((int)session.getAttribute("userNo"));

//			// 모델값 전달
			model.addAttribute("challenge", challenge);
			logger.info("챌린지 나오게 해주세요", challenge);
//			chlJoinService.join(challenge);
			
			return "challenge/complete";
		}
}
