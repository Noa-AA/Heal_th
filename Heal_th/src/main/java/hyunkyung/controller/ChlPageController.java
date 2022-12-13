package hyunkyung.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ParticipantList;
import hyunkyung.service.face.ChlPageService;
import yerim.dto.Users;

@Controller
public class ChlPageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChlPageService chlPageService;
	
	//마이페이지 폼
	@GetMapping("/challenge/mypage")
	public void mypageGET(/*int participantNo,*/ ParticipantList participantList, Challenge challenge, HttpSession session, Model model) {
		logger.info("/challenge/mypage[GET]");
		
		//로그인 데이터
		session.setAttribute("userno", 1);
		int userno = (int)session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		Users user = chlPageService.getUserInfo(userno);
		logger.info("userInfo : {}", user);
		model.addAttribute("user",user);

		
		//챌린지 정보
		Challenge challenges = chlPageService.selectChlInfo(challenge);
		logger.info("challenges : {}", challenge);
		model.addAttribute("challenges",challenges);
		
		model.addAttribute("challengeInfo: {}" , chlPageService.selectChlInfo(challenge));
		
		
		//챌린지 참여자 목록
		ParticipantList pList = chlPageService.selectPList(participantList);
		logger.info("pList : {}", participantList);
		model.addAttribute("pList", pList);
		
		model.addAttribute("pListInfo : {}", chlPageService.selectPList(participantList));
		
	}
	
	//클릭하면 사진 첨부

}
