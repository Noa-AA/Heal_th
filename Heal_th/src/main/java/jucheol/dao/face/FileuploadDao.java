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


}
