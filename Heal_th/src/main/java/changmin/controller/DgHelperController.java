package changmin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.GET)
	public void recordView(Model model,String curPage, HttpSession session) {
		logger.info("/dghelper/healthrecord [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		Paging paging = dgHelperService.getPaging(curPage, userno);
		List<HealthRecord> recordList = dgHelperService.getRecordList(paging, userno);
		
		model.addAttribute("list",recordList);
		
		logger.info("List : {}", recordList);
	}
	
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
	
}
