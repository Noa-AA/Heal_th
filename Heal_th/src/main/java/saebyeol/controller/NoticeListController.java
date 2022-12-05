package saebyeol.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import saebyeol.service.face.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeListController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired NoticeService noticeService;
	
	@RequestMapping("/list")
	public void list() {
		logger.info("/list");
	}
	

}
