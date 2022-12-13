package saebyeol.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import saebyeol.dto.Notice;
import saebyeol.service.face.NoticeService;
import saebyeol.utill.SaebyeolPaging;

@Controller
@RequestMapping("/notice")
public class NoticeListController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired NoticeService noticeService;
	
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model ) {
		
		SaebyeolPaging paging = noticeService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Notice> list = noticeService.list(paging);
		for( Notice n : list )	logger.debug("{}", n);
		model.addAttribute("list", list);
		
	
	}
	
	@RequestMapping("/view")
	public String view(Notice viewNotice, Model model) {
		
		viewNotice = noticeService.view(viewNotice);
		
		model.addAttribute("viewNotice",viewNotice);
		
		return "notice/view";
		
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(Model model) {
		
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Notice notice) {
		
		noticeService.write(notice);
		
		return "redirect:/notice/list";
		
	}
	
	@GetMapping("/update")
	public String update(Notice notice, Model model) {
		notice = noticeService.view(notice);
		
		model.addAttribute("updateNotice", notice);
		
		return "notice/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(Notice notice) {
		logger.info("{}",notice);
		noticeService.update(notice);
		
		return "redirect:/notice/view?noticeNo=" + notice.getNoticeNo();
	}
	

}
