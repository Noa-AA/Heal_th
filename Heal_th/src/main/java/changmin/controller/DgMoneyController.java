package changmin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import changmin.service.face.DgMoneyService;

@Controller
public class DgMoneyController {

	private Logger logger = LoggerFactory.getLogger(DgMoneyController.class);
	
	@Autowired private DgMoneyService dgMoneyService;
	
	@RequestMapping(value = "/dgmoney/charge")
	public void moneyCharge() {
		logger.info("/dgmoney/charge [GET]");
	}
}
