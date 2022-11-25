package changmin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import changmin.service.face.DgHelperService;

@Controller
public class DgHelperController {

	private Logger logger = LoggerFactory.getLogger(DgHelperController.class);
	
	@Autowired private DgHelperService dgHelperService;
	
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.GET)
	public void recordView() {
		logger.info("/dghelper/healthrecord [GET]");
		
	}
	
	@RequestMapping(value="/dghelper/healthrecord", method=RequestMethod.POST)
	public void recordAdd(String recordcon) {
		logger.info("/dghelper/healthrecord [POST]");
		
		logger.info("recordcon : {}", recordcon);
	
		dgHelperService.insertRecord(recordcon);
		
	}
}
