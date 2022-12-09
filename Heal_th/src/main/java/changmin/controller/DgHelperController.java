package changmin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import changmin.dto.BodyInfo;
import changmin.dto.DgmaJoin;
import changmin.dto.Dgmachat;
import changmin.dto.Dgmagotchi;
import changmin.dto.HealthRecord;
import changmin.service.face.DgHelperService;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

@Controller
public class DgHelperController {

	private Logger logger = LoggerFactory.getLogger(DgHelperController.class);
	
	@Autowired private DgHelperService dgHelperService;
	
	//운동도우미 메인
	@RequestMapping(value="/dghelper/main", method=RequestMethod.GET)
	public void dghelperMain() {
		logger.info("/dghelper/main [GET]");
	}
	
	//개별회원의 운동기록 조회
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.GET)
	public String recordView(Model model, String curPage, HttpSession session) {
		logger.info("/dghelper/healthrecord [GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		
			DgHelperPaging dgHelperPaging = dgHelperService.getDgHelperPaging(curPage, userno);
			List<HealthRecord> recordList = dgHelperService.getRecordList(dgHelperPaging, userno);
		
			model.addAttribute("list",recordList);
			model.addAttribute("paging", dgHelperPaging);
			
			logger.info("List : {}", recordList);
			logger.info("페이징 : {}", dgHelperPaging);
			
			return "/dghelper/healthrecord";
		} else {
			return "/login/login";
		}
	}
	
	//개별회원의 운동기록 추가
	@ResponseBody
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.POST)
	public int recordAdd(HealthRecord healthRecord, HttpSession session) {
		logger.info("/dghelper/healthrecord [POST]");
		
		healthRecord.setUserNo((int)session.getAttribute("userNo"));

		logger.info("recordCon : {}", healthRecord.getRecordCon());
		logger.info("HealthUserno : {}", healthRecord.getUserNo());
		
		int result = dgHelperService.addRecord(healthRecord);
		
		return result; 
	}
	
	//운동일기 삭제
	@RequestMapping(value="/dghelper/deleterecord", method=RequestMethod.POST)
	public String healthRecordDelete(Model model, int recordNo) {
		logger.info("/dghelper/deleterecord [POST]");
		
		dgHelperService.removeRecord(recordNo);
		
		return "redirect: /dghelper/healthrecord";
	}
	
	//운동일기 수정
	@RequestMapping(value="/dghelper/updaterecord", method=RequestMethod.POST)
	public String healthRecordUpdate(Model model, int recordNo) {
		logger.info("/dghelper/updaterecord [POST]");
		
		dgHelperService.changeRecord(recordNo);
		
		return "redirect: /dghelper/healthrecord";
	}
	
	//------------------------------------------------------------------
	
	//운동가이드 조회
	@RequestMapping(value="/dghelper/healthguide", method=RequestMethod.GET)
	public String guideView(HttpSession session, Model model) {
		logger.info("/dghelper/healthguide [GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			int userno = (int) session.getAttribute("userNo");
			logger.info("userno : {}", userno);
			
			Users user = dgHelperService.getUserInfo(userno);
			logger.info("user : {}", user);
			model.addAttribute("user", user);
			
			//나이 계산
			String str = "";
			for(int i=0; i<4; i++) {
				str += user.getUserBirth().charAt(i);
			}
			int age = 0;
			for(int j=0; j<str.length(); j++) {
				age = (2022-Integer.parseInt(str))+1;
			}
			model.addAttribute("age", age);
			
			BodyInfo bodyInfo = dgHelperService.getBodyInfo(userno);
			logger.info("bodyInfo : {}", bodyInfo);
			model.addAttribute("bodyInfo", bodyInfo);
			
			return "/dghelper/healthguide";
		} else {
			return "/login/login";
		}
			
	}
	
	//칼로리 조회
	@RequestMapping(value="/dghelper/calorie", method=RequestMethod.GET)
	public void calorie(Model model,String foodname) {
		logger.info("/dghelper/calorie [GET]");

		String URL = "";
		if(foodname!="") {
			URL = "http://openapi.foodsafetykorea.go.kr/api/6087679be3c94a609763/I2790/xml/1/1/DESC_KOR=" + foodname;
		}
		
		try {
			
			Document doc = Jsoup.connect(URL).get();
			
			Elements msg = doc.select("MSG");
			Elements serving = doc.select("SERVING_SIZE");
			Elements kcal = doc.select("NUTR_CONT1");
			Elements food = doc.select("DESC_KOR"); 

			logger.info("실행결과 : {}", msg);
			logger.info("1회 제공량 : {}", serving);
			logger.info("칼로리 : {}", kcal);
	        logger.info("음식명 : {}", food);
	
	        model.addAttribute("msg", msg);
	        model.addAttribute("serving", serving);
	        model.addAttribute("cal", kcal);
	        model.addAttribute("food", food);
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//칼로리 계산
	@RequestMapping(value="/dghelper/calorieProc", method=RequestMethod.GET)
	public void calorieProc() {
		logger.info("/dghelper/caloriePorc [GET]");
		
	}
	
	//--------------------------------------------------------------------
	
	//운동성향 테스트 조회
	@RequestMapping(value="/dghelper/healthtest", method=RequestMethod.GET)
	public void healthTest() {
		logger.info("/dghelper/healthtest [GET]");
		
	}
	
	//--------------------------------------------------------------------
	
	//득근이 시작화면
	@RequestMapping(value="/dghelper/dgmagotchi", method=RequestMethod.GET)
	public String dgmagotchiStart(HttpSession session) {
		logger.info("/dghelper/dgmagotchi [GET]");
		
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			return "/dghelper/dgmagotchi";
		} else {
			return "/login/login";
		}
	}
	
	//득근이 키우기
	@RequestMapping(value="/dghelper/dgmagotchiContent", method=RequestMethod.GET)
	public void dgmagotchi(HttpSession session, Model model) {
		logger.info("/dghelper/dgmagotchiContent [GET]");
		
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);

		
		//득마고치 정보가 없을 경우 새로 만들기
		int cnt = dgHelperService.getDgmaCnt(userno);
		
		if(cnt==0) {
			dgHelperService.addDgmaInfo(userno);
		}
		
		//득마고치 정보 불러오기
		Dgmagotchi dgmaLoad = dgHelperService.getDgmaInfo(userno);
		model.addAttribute("dgmainfo", dgmaLoad);
		
		//득마고치 랭킹 조회
		List<DgmaJoin> dgmaRanking = dgHelperService.getDgmaRanking();
		logger.info("dgmaRanking : {}", dgmaRanking);
		model.addAttribute("dgmaRanking", dgmaRanking);
		
		//득마고치 닉네임 조회
		String nick = dgHelperService.getMyNick(userno);
		logger.info("myNick : {}", nick);
		model.addAttribute("nick", nick);
			
	}
	
	//득근이 저장
	@ResponseBody
	@RequestMapping(value="/dghelper/dgmasave", method=RequestMethod.POST)
	public int dgmagotchiSave(Dgmagotchi dgmagotchi, Model model, HttpSession session) {
		logger.info("/dghelper/dgmasave [POST]");
		
		int userno = (int) session.getAttribute("userNo");
		logger.info("saveUserno : {}", userno);
		
		logger.info("dgmagotchi : {}", dgmagotchi);
		
		dgHelperService.saveDgmaInfo(dgmagotchi);
		
		model.addAttribute("dgmagotchi", dgmagotchi);
		
		return dgmagotchi.getDgmaExp();
	}
	
	@RequestMapping(value="/dghelper/dgmaChat", method=RequestMethod.POST)
	public void dgmaChatPost(Dgmachat dgmachat) {
		logger.info("/dghelper/dgmaChat [POST]");
		
		logger.info("dgmachat : {}", dgmachat);
		
		dgHelperService.pushChat(dgmachat);
	}

	@RequestMapping(value="/dghelper/dgmaChat", method=RequestMethod.GET)
	public void dgmaChatGet(Dgmachat dgmachat, Model model) {
		logger.info("/dghelper/dgmaChat [GET]");
		
		List<Dgmachat> chatList = dgHelperService.getDgmaChat();
		logger.info("chatList : {}", chatList);
		
		model.addAttribute("chat",chatList);
	}
	//--------------------------------------------------------------------
}

