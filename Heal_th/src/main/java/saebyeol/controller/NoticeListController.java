package saebyeol.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public void list(@RequestParam(defaultValue="0") int curPage, Model model) {
		logger.info("/list");
		
		SaebyeolPaging paging = noticeService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Notice> list = noticeService.list(paging);
		for(Notice n : list) logger.info("List {}", n);
		model.addAttribute("list", list);
		
	}
	

}
