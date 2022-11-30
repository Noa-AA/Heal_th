package unhak.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import unhak.service.face.StoreService;

@Controller
public class StoreController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired private StoreService storeService;
	
	@RequestMapping("/store/list")
	public void storelist() {
		logger.info("store/list[GET]");
	}



	@RequestMapping("/store/view")
	public void storeview() {
		logger.info("store/view[GET]");
	}	



}
