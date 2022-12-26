package jucheol.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import jucheol.dto.Comment;
import jucheol.dto.Fileupload;
import jucheol.service.face.FileuploadService;

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
	
	@GetMapping("/list")
	public void fileList(
			int category
			, int boardno
			, Model model
			, Fileupload fileupload
			) {
		logger.info("/file/list[GET]");
		
		fileupload.setBoardNo(boardno);
		fileupload.setCategoryNo(category);
		
		List<Fileupload> fileList = fileuploadService.getFileList(fileupload);
		for( Fileupload f : fileList ) logger.info("list-{}",f);
		
		model.addAttribute("fileList",fileList);
	}
	
	@Autowired private FileuploadService fileuploadService; // ------추가, 임포트는 => import jucheol.service.face.FileuploadService;
	@PostMapping("/write")
	public void fileupload(
			List<MultipartFile> multiFile //-----------추가해주세여~
			) {
		logger.info("file/write[POST]");
		//-------- 여기부터
		int boardNo = 3; //----------------1 대신 해당게시판 글번호 넣어주세여 ex) bfBoard.getBfNo()
		int categoryNo = 2;//----------------카테고리번호 넣어주세여~
		fileuploadService.insertFile(multiFile,boardNo,categoryNo);
		//-------- 여기까지
	}
}
