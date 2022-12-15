package hyunkyung.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlPageService;
import yerim.dto.Users;

@Controller
public class ChlPageController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChlPageService chlPageService;

	// 마이페이지 폼
	@GetMapping("/challenge/mypage")
	public String mypageGET(HttpSession session, Model model) {
		logger.info("/challenge/mypage[GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			Users user = chlPageService.getUserInfo(userno);
			logger.info("userInfo : {}", user);
			model.addAttribute("user",user);

			//회원번호로 내가 가입한 챌린지 조회
			List<Challenge> joinList = chlPageService.getList(userno);
			
			model.addAttribute("joinList", joinList);
			logger.info("controller joinList : {}", joinList);
			
			//내가 가입한 챌린지 총 갯수
//			Challenge total = chlPageService.getTotal(userno);
//			model.addAttribute("total", total);
//			logger.info("total 갯수 : {} ", total);
			
			return "challenge/mypage";
		}else {
			return "/login/login";
		}
	}

	// 원하는 챌린지 클릭후 인증용 사진 첨부
//	@PostMapping("/challenge/mypage")
//	public void mypagePOST(HttpSession session, Model model) {
//		logger.info("/challenge/mypage[POST]");
//		
//	}
	
	@GetMapping("/challenge/photopage")
	public void challengeGetPhotopage() {
		logger.info("/challenge/photopage [GET]");
	}
}
