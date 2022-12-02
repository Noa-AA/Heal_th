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

import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import changmin.service.face.DgMoneyService;
import yerim.dto.Users;

@Controller
public class DgMoneyController {

	private Logger logger = LoggerFactory.getLogger(DgMoneyController.class);
	
	@Autowired private DgMoneyService dgMoneyService;

	//득근머니 조회
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
		
		int wdCnt = dgMoneyService.cntWithDraw(userno);
		logger.info("미처리 개수 : {}", wdCnt);
		model.addAttribute("wdCnt", wdCnt);
		
	}

	//득근머니 충전
	@RequestMapping(value = "/dgmoney/view", method = RequestMethod.POST)
	public String moneyCharge(MmoneyPay mmoneyPay) {
		logger.info("/dgmoney/charge [POST]");
		
		logger.info("mmoneypay : {} ", mmoneyPay);
		
		dgMoneyService.addMmoney(mmoneyPay);
		
		dgMoneyService.chargeMmoney(mmoneyPay);
		
		return "/dgmoney/view";
	}
		
	//득근머니 인출신청
	@RequestMapping(value = "/dgmoney/discharge", method = RequestMethod.GET)
	public void moneyDisCharge(HttpSession session, Model model) {
		logger.info("/dgmoney/dischage [GET]");
		
		session.setAttribute("userno", 7777);
		int userno = (int) session.getAttribute("userno");
		logger.info("userno : {}", userno);
		
		model.addAttribute("userno", userno);
		
	}

	//득근머니 인출신청 기록
	@RequestMapping(value = "/dgmoney/dischargeProc", method = RequestMethod.POST)
	public String moneyDisChargeProc(WithDraw withDraw) {
		logger.info("/dgmoney/dischargeProc [POST]");
		
		logger.info("인출신청 정보 : {}", withDraw);
		
		dgMoneyService.addWithDraw(withDraw);
		
		return "/dgmoney/dischargeProc";
	}
	
	//득근머니 인출신청 완료
	@RequestMapping(value = "/dgmoney/dischargeProc", method = RequestMethod.GET)
	public void disChargeProc() {
		logger.info("/dgmoney/dischargeProc [GET]");
	}
	
	//관리자 - 인출신청내역 조회
	@RequestMapping(value = "/admin/withdraw", method = RequestMethod.GET)
	public void withDrawAdmin(Model model) {
		logger.info("/admin/withdraw [GET]");
		
		
		List<WithDraw> withDraw = dgMoneyService.getWithDrawList();
		logger.info("인출신청 리스트 : {}", withDraw);
		
		model.addAttribute("withDraw", withDraw);
	}
	
	//관리자 - 인출신청 승인
	@RequestMapping(value = "/admin/withdrawProc", method = RequestMethod.POST)
	public String withDrawUpdate(Model model, WithDraw wd) {
		logger.info("/admin/withdrawProc [POST]");
		
		List<WithDraw> withDraw = dgMoneyService.getWithDrawList();
		logger.info("인출신청 리스트 : {}", withDraw);
		
		dgMoneyService.changeMmoney(wd);

		
		model.addAttribute("withDraw", withDraw);
		
		return "redirect: /admin/withdraw";
	}
	
}
