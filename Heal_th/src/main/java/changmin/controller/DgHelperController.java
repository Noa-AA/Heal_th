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
	public void recordView(Model model, String curPage, HttpSession session) {
		logger.info("/dghelper/healthrecord [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		DgHelperPaging dgHelperPaging = dgHelperService.getDgHelperPaging(curPage, userno);
		List<HealthRecord> recordList = dgHelperService.getRecordList(dgHelperPaging, userno);
	
		model.addAttribute("list",recordList);
		model.addAttribute("paging", dgHelperPaging);
		
		logger.info("List : {}", recordList);
		logger.info("페이징 : {}", dgHelperPaging);
	}
	
	//개별회원의 운동기록 추가
	@ResponseBody
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.POST)
	public int recordAdd(HealthRecord healthRecord, HttpSession session) {
		logger.info("/dghelper/healthrecord [POST]");
		
		session.setAttribute("userno", 7777);
		healthRecord.setUserNo((int)session.getAttribute("userno"));

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
	public void guideView(HttpSession session, Model model) {
		logger.info("/dghelper/healthguide [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
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
	
}

