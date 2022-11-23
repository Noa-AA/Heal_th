package changmin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import changmin.service.face.DgHelperService;

@Controller
public class DgHelperController {

	private Logger logger = LoggerFactory.getLogger(DgHelperController.class);
	
	@Autowired private DgHelperService healthHelperService;
	
	@RequestMapping(value="/dghelper/healthrecord")
	public void recordView() {
		logger.info("/healthhelper/healthrecord [GET]");
		
	}
}
