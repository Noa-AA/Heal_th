package jucheol.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jucheol.dao.face.FileuploadDao;
import jucheol.dto.Fileupload;
import jucheol.service.face.FileuploadService;

@Service
public class FileuploadServiceImpl implements FileuploadService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FileuploadDao fileuploadDao;

	@Autowired ServletContext context;
	HttpSession session;
	public void insertFile(List<MultipartFile> multiFile ,int boardNo, int categoryNo) {
		//빈 파일일 경우
		if( multiFile.size() <= 0 || multiFile.get(0).getSize() <= 0) {
			return;
		}
		for( MultipartFile m : multiFile )	logger.debug("{}", m);
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		List<Map<String, String>> fileList = new ArrayList<>();
		for(int i=0; i<multiFile.size(); i++) {
			String originName = multiFile.get(i).getOriginalFilename();
			String storedName = originName + UUID.randomUUID().toString().split("-")[4];
			
			Map<String, String> map = new HashMap<>();
			map.put("originName", originName);
			map.put("storedName", storedName);
			
			fileList.add(map);
		}
//		String originName =  ((MultipartFile) multiFile).getOriginalFilename();
//		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		
		try {
			for(int i = 0; i < multiFile.size(); i++) {
				File dest = new File(storedFolder , fileList.get(i).get("storedName"));
				multiFile.get(i).transferTo(dest);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		for(int i = 0; i < multiFile.size(); i++) {
			Fileupload fileUpload = new Fileupload();
			fileUpload.setBoardNo( boardNo );
			fileUpload.setCategoryNo(categoryNo);
			fileUpload.setFileOri(fileList.get(i).get("originName"));
			fileUpload.setFileSto(fileList.get(i).get("storedName"));
			
			fileuploadDao.insertFile(fileUpload);	
		}

	}

	@Override
	public List<Fileupload> getFileList(Fileupload fileupload) {
		return fileuploadDao.getFileList(fileupload);
	}

	@Override
	public void updateFile(List<MultipartFile> multiFile, int boardNo, int categoryNo) {
		//---------여기부터
		Fileupload fileUpload = new Fileupload();
		fileUpload.setBoardNo(boardNo);
		fileUpload.setCategoryNo(categoryNo);
		
		fileuploadDao.deleteFile(fileUpload);
		//-------여기까지
		logger.info("multiFileSize : {}",multiFile.size());
		if(multiFile.get(0).getSize() <= 0 ) {
			return;
		}else {
			insertFile(multiFile , boardNo,  categoryNo);
		}
	}


}
