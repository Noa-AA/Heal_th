package hyunkyung.controller;


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

	//챌린지 가입,결제 화면
		@GetMapping("/challenge/join")
		public String join(int challengeNo, Challenge challenge/*, int mNo, MmoneyUse mmoney*/, Model model, HttpSession session) {
			logger.info("challenge/join [GET]");
			
			if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
				
				int userno = (int) session.getAttribute("userNo");
				logger.info("userno : {}", userno);
				
				Users user = chlJoinService.getUserInfo(userno);
				logger.info("userInfo : {}", user);
				model.addAttribute("user", user);

			
			//챌린지 정보
			Challenge challenges = chlJoinService.selectInfo(challengeNo);
			logger.info("challenges : {}", challengeNo);
			model.addAttribute("challenges",challenges);
			
			model.addAttribute("challengeInfo: {}" , chlJoinService.selectInfo(challengeNo));
			
			//mCharge, 현재 보유 포인트 조회
//			int mmoney = chlJoinService.getMmoney(userno);
			MmoneyUse mmoney = chlJoinService.getMmoney(userno);
			logger.info("mmoney: {}", mmoney);
			model.addAttribute("mmoney", mmoney);
				
				return "challenge/join";
			}else {
				return "/login/login";
			}
			
			

			
			
		}

		
		// 챌린지 가입,결제 버튼 누를때 -> 결제완료 화면으로 넘어가는
		@PostMapping("/challenge/join")
		public String joinProc(ParticipantList pList, HttpSession session) {
			logger.info("challenge/join [POST]");
			
			pList.setUserNo((int)session.getAttribute("userNo"));
			
			chlJoinService.insert(pList);
			logger.info("pList: {}", pList);
			
			return "challenge/complete";
		}
}
