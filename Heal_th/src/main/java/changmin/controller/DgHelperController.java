package changmin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import changmin.dto.HealthRecord;
import changmin.service.face.DgHelperService;
import changmin.util.Paging;

@Controller
public class DgHelperController {

	private Logger logger = LoggerFactory.getLogger(DgHelperController.class);
	
	@Autowired private DgHelperService dgHelperService;
	
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.GET)
	public void recordView(Model model,String curPage) {
		logger.info("/dghelper/healthrecord [GET]");
		
		Paging paging = dgHelperService.getPaging(curPage);
		List<HealthRecord> recordList = dgHelperService.getRecordList(paging);
		
		model.addAttribute("list",recordList);
		
		logger.info("List : {}", recordList);
	}
	
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.POST)
	public void recordAdd(String recordcon) {
		logger.info("/dghelper/healthrecord [POST]");
		
		logger.info("recordcon : {}", recordcon);
	
		dgHelperService.insertRecord(recordcon);
		
	}
	
	//------------------------------------------------------------------
	
	
	@RequestMapping(value="/dghelper/healthguide", method=RequestMethod.GET)
	public void guideView() {
		logger.info("/dghelper/healthguide [GET]");
		
		
	}
	
}
