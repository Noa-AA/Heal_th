package hyunkyung.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.MmoneyUse;
import hyunkyung.dto.ParticipantList;
import hyunkyung.service.face.ChlJoinService;
import yerim.dto.Users;

@Controller
public class ChlJoinController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChlJoinService chlJoinService;

	// 챌린지 가입,결제 화면
	@GetMapping("/challenge/join")
	public String join(int challengeNo, Model model, HttpSession session) {
		logger.info("challenge/join [GET]");

		Object userNo = session.getAttribute("userNo");

		// 로그인 X때 로그인 페이지 이동
		if (userNo == null || userNo == "") {
			return "/login/login";
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("challengeNo", challengeNo);
		data.put("userNo", userNo);

		// 로그인 한상태 + 이미 가입한 챌린지일경우 마이페이지로 이동
		int participantResult = chlJoinService.selectParticipant(data);
		if (participantResult > 0) {
			return "redirect:/challenge/mypage";
		}

		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);

		Users user = chlJoinService.getUserInfo(userno);
		logger.info("userInfo : {}", user);
		model.addAttribute("user", user);

		// 챌린지 정보
		Challenge challenges = chlJoinService.selectInfo(challengeNo);
		logger.info("challenges : {}", challengeNo);
		model.addAttribute("challenges", challenges);

		model.addAttribute("challengeInfo: {}", chlJoinService.selectInfo(challengeNo));

		// mCharge, 현재 보유 포인트 조회
		MmoneyUse mmoney = chlJoinService.getMmoney(userno);
		logger.info("mmoney: {}", mmoney);
		model.addAttribute("mmoney", mmoney);

		return "challenge/join";

	}

	// 챌린지 가입,결제 버튼 누를때 -> 결제완료 화면으로 넘어가는
	@PostMapping("/challenge/join")
	public String joinProc(ParticipantList pList, HttpSession session) {
		logger.info("challenge/join [POST]");
		System.out.println(pList);

		pList.setUserNo((int) session.getAttribute("userNo"));

		chlJoinService.insert(pList);
		logger.info("pList: {}", pList);

		return "challenge/complete";
	}
}
