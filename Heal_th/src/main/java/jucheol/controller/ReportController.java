package jucheol.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jucheol.dto.Report;
import jucheol.dto.Scrap;
import jucheol.service.face.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ReportService reportService;
	
	@GetMapping("/report")
	public void report() {
		logger.info("/report/report[GET]");
	}
	
	@PostMapping("/check")
	public String reportCheck(
			HttpSession session
			,Report report
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/report/check[POST]");
		
//		session.setAttribute("userNo", 7777);
		
		report.setUserNo((int) session.getAttribute("userNo"));
		report.setBoardNo(boardno);
		report.setCategoryNo(category);
		logger.info("reportCheck111 - {}", report);
		
		report = reportService.reportCheck(report);
		
		logger.info("reportCheck222 - {}", report);
		
		if(report == null) {
			logger.info("신고 이력 없음");
			report = new Report();
			report.setBoardNo(boardno);
			report.setCategoryNo(category);
		} else {
			model.addAttribute("report", report);
			
		}
			
		
		return "report/reportAdd";
	}
	
	@PostMapping("/add")
	public String addReport(
			HttpSession session
			,Report report
			, int category
			, int boardno
			, Model model
			) {
		logger.info("/report/add[POST]");
		
		//-----------테스트용 유저삽입
//		session.setAttribute("userNo", 7777);
		
		report.setUserNo((int) session.getAttribute("userNo"));
		report.setBoardNo(boardno);
		report.setCategoryNo(category);
		
		reportService.addReport(report);
		
		model.addAttribute("report", report);
		
		return "scrap/scrapAdd";
		
	}
	
	@PostMapping("/delete")
	public String deleteReport(
			Model model
			,int reportNo
			,Report report
			) {
		logger.info("/report/delete[POST]");
		report.setReportNo(reportNo);
		reportService.deleteReport(report);
		
		return "report/report";
	}
	
	@PostMapping("/deletePost")
	public String deletePost(
			Model model
			,int reportNo
			,Report report
			) {
		logger.info("/report/deletePost[POST]");
		report.setReportNo(reportNo);
		reportService.deletePost(report);
		
		return "report/report";
	}
	
	@GetMapping("/list")
	public void scrapList(
			HttpSession session
			, Report report
			, Model model
			) {
		logger.info("/report/list[GET]");

		//-----------테스트용 유저삽입
//		session.setAttribute("userNo", 7777);
		
		report.setUserNo((int) session.getAttribute("userNo"));
		
		List<Report> reportList = reportService.selectList(report);
		for( Report r : reportList )logger.info("reportList {}",r);
		
		
		model.addAttribute("reportList", reportList);
	}
}
