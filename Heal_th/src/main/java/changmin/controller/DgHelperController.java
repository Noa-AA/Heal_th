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

import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.service.face.DgHelperService;
import changmin.util.Paging;

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
	public void recordView(Model model,String curPage, HttpSession session) {
		logger.info("/dghelper/healthrecord [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		Paging paging = dgHelperService.getPaging(curPage, userno);
		List<HealthRecord> recordList = dgHelperService.getRecordList(paging, userno);
	
		int cnt = dgHelperService.getCntRecord(recordList);
		logger.info("운동기록 횟수 : {}", cnt);
		
		model.addAttribute("list",recordList);
		model.addAttribute("cnt", cnt);
		
		logger.info("List : {}", recordList);
	}
	
	//개별회원의 운동기록 추가
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.POST)
	public void recordAdd(String recordcon, HttpSession session) {
		logger.info("/dghelper/healthrecord [POST]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		logger.info("recordcon : {}", recordcon);
	
		dgHelperService.addRecord(recordcon, userno);
		
	}
	
	//------------------------------------------------------------------
	
	//운동가이드 조회
	@RequestMapping(value="/dghelper/healthguide", method=RequestMethod.GET)
	public void guideView(HttpSession session, Model model) {
		logger.info("/dghelper/healthguide [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		BodyInfo bodyInfo = dgHelperService.getBodyInfo(userno);
		logger.info("bodyInfo : {}", bodyInfo);
		
		model.addAttribute("bodyInfo",bodyInfo);

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
			Elements elem = doc.select("#0");
			String[] str = elem.text().split(" ");
			
	        logger.info("칼로리 : {}", str[7]);
	        logger.info("음식명 : {}", str[17]);
	        
	        model.addAttribute("cal", str[7]);
	        model.addAttribute("food", str[17]);
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//--------------------------------------------------------------------
	
	@RequestMapping(value="/dghelper/healthtest", method=RequestMethod.GET)
	public void healthTest() {
		logger.info("/dghelper/healthtest [GET]");
		
	}
	
}
