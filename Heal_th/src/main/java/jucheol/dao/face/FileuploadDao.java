package jucheol.dao.face;

import java.util.List;

import jucheol.dto.Fileupload;

public interface FileuploadDao {

	/**
	 * 글번호,카테고리로 파일저장
	 * 
	 * @param fileupload 파일,글번호, 카테고리번호 담겨있음
	 */
	public void insertFile(Fileupload fileupload);

	/**
	 * 파일정보 가져오기
	 * 
	 * @param fileupload 글번호, 카테고리 번호 담겨있음
	 * @return
	 */
	public List<Fileupload> getFileList(Fileupload fileupload);


	/**
	 * 카테고리, 글번호를 이용해 파일 삭제
	 * 
	 * @param fileUpload
	 */
	public void deleteFile(Fileupload fileUpload);


}
