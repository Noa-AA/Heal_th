package jucheol.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/file")
public class FileuploadContoller {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/test")
	public void filetest() {
		logger.info("file/test[get]");
	}
	@GetMapping("/upload")
	public void fileUpload() {
		logger.info("/file/upload[GET]");
	}
}
