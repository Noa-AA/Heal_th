package jucheol.dao.face;

import java.util.List;

import jucheol.dto.Fileupload;

public interface FileuploadDao {

	/**
	 * 글번호,카테고리로 파일저장
	 * 
	 * @param fileupload
	 */
	public void insertFile(Fileupload fileupload);

	public List<Fileupload> getFileList(Fileupload fileupload);


}
