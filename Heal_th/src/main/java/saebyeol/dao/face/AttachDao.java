package saebyeol.dao.face;

import java.util.List;

import saebyeol.dto.AttachImage;

public interface AttachDao {

	//이미지 데이터 반환
	public List<AttachImage> getAttachList(int prodNo);
}
