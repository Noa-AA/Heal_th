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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
			
			return "challenge/mypage";
		}else {
			return "/login/login";
		}
	}


	
	//사진인증 페이지 조회
	@GetMapping("/challenge/photopage")
	public void challengeGetPhotopage(int challengeNo, Model model, HttpSession session) {
		logger.info("/challenge/photopage [GET]");
		
		//챌린지 정보 조회
		model.addAttribute("pageInfo", chlPageService.getPage(challengeNo));
		
		
		int userno = (int) session.getAttribute("userNo");
		Users user = chlPageService.getUserInfo(userno);
		logger.info("userInfo : {}", user);
		model.addAttribute("user",user);
		
		//인증한 사진들 리스트
		model.addAttribute("list", chlPageService.getPhoto(challengeNo));
	}
	
	@PostMapping("/challenge/photopage")
	public void challengePostPhotopage(
			MultipartFile file,
			@RequestParam("file") MultipartFile fileupload
			) {
		logger.info("/challenge/photopage [POST]");
//		chlPageService.filesave(file);
	}
}
