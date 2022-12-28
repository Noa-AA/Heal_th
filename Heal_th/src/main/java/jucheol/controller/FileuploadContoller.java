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

import jucheol.dto.Fileupload;
import jucheol.service.face.FileuploadService;
import oracle.jdbc.proxy.annotation.Post;

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
		for( MultipartFile m : multiFile ) logger.info("multiFile-{}",m);
		//-------- 여기부터
		int boardNo = 1; //----------------1 대신 해당게시판 글번호 넣어주세여 ex) bfBoard.getBfNo()
		int categoryNo = 4;//----------------카테고리번호 넣어주세여~
		
		fileuploadService.insertFile(multiFile,boardNo,categoryNo);
		//-------- 여기까지
	}
	
	@GetMapping("/updateview")
	public void fileupdateview(
			Model model
			) {
		logger.info("/file/updateview[get]");
		
		int boardNo = 1; //----------------1 대신 해당게시판 글번호 넣어주세여 ex) bfBoard.getBfNo()
		int categoryNo = 4;//----------------카테고리번호 넣어주세여~
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("categoryNo", categoryNo);
		
	}
	@GetMapping("/updateList")
	public void updateList(
			Fileupload fileupload
			, Model model
			, int boardNo
			, int category
			) {
		logger.info("/file/updateList[GET]");
		fileupload.setBoardNo(boardNo);
		fileupload.setCategoryNo(category);
		List<Fileupload> fileList = fileuploadService.getFileList(fileupload);
		for( Fileupload f : fileList ) logger.info("fileList-{}",f);
		model.addAttribute("fileList", fileList);
		
	}
	@PostMapping("/update")
	public void updatefile(
			List<MultipartFile> multiFile
			) {
		
		logger.info("/file/updatefile[post]");
		for( MultipartFile m : multiFile ) logger.info("multiFile-{}",m);
		
		int boardNo = 1; //----------------1 대신 해당게시판 글번호 넣어주세여 ex) bfBoard.getBfNo()
		int categoryNo = 4;//----------------카테고리번호 넣어주세여~
		fileuploadService.updateFile(multiFile,boardNo,categoryNo);
	}
}
