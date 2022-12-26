package jucheol.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jucheol.dto.Fileupload;

public interface FileuploadService {

	public void insertFile(List<MultipartFile> multiFile ,int boardNo, int categoryNo);

	public List<Fileupload> getFileList(Fileupload fileupload);

	
	
}
