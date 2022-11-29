package changmin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import changmin.service.face.DgMoneyService;
import yerim.dto.Users;

@Controller
public class DgMoneyController {

	private Logger logger = LoggerFactory.getLogger(DgMoneyController.class);
	
	@Autowired private DgMoneyService dgMoneyService;
	
	@RequestMapping(value = "/dgmoney/view", method = RequestMethod.GET)
	public void moneyView(Model model,HttpSession session) {
		logger.info("/dgmoney/view [GET]");

		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		Users user = dgMoneyService.getUserInfo(userno);
		logger.info("userInfo : {}", user);
		model.addAttribute("user", user);
		
		int mmoney = dgMoneyService.getMmoney(userno);
		
		logger.info("mmoney : {}", mmoney);
		model.addAttribute("mmoney", mmoney);
	}
	
	@RequestMapping(value = "/dgmoney/charge", method = RequestMethod.POST)
	public void moneyCharge(MmoneyPay mmoneyPay) {
		logger.info("/dgmoney/charge [POST]");
		
		logger.info("mmoneypay : {} ", mmoneyPay);
		
		dgMoneyService.addMmoney(mmoneyPay);
		
		dgMoneyService.chargeMmoney(mmoneyPay);
	}
	
	@RequestMapping(value = "/dgmoney/discharge", method = RequestMethod.GET)
	public void moneyDisCharge(HttpSession session, Model model) {
		logger.info("/dgmoney/dischage [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		model.addAttribute("userno", userno);
		
	}

	@RequestMapping(value = "/dgmoney/dischargeProc", method = RequestMethod.POST)
	public void moneyDisChargeProc(WithDraw withDraw) {
		logger.info("/dgmoney/dischargeProc [POST]");
		

		
		logger.info("인출신청 정보 : {}", withDraw);
		
		dgMoneyService.addWithDraw(withDraw);
	}
	
	
	
}
