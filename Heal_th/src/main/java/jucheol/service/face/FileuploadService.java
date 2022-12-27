package jucheol.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jucheol.dto.Fileupload;

public interface FileuploadService {

	/**
	 * 파일 db저장
	 * 
	 * @param multiFile 파일
	 * @param boardNo 게시판 글번호
	 * @param categoryNo 게시판 카테고리번호
	 */
	public void insertFile(List<MultipartFile> multiFile ,int boardNo, int categoryNo);

	/**
	 * 파일정보 가져오기
	 * 
	 * @param fileupload 글번호, 카테고리 번호 담겨있음
	 * @return
	 */
	public List<Fileupload> getFileList(Fileupload fileupload);

	
	
}
