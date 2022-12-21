package saebyeol.service.face;

import java.util.List;

import org.springframework.http.ResponseEntity;

import saebyeol.dto.AttachImage;

public interface AttachService {
	
	public List<AttachImage> getAttachList(int prodNo);

}
