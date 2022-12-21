package saebyeol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import saebyeol.dao.face.AttachDao;
import saebyeol.dto.AttachImage;
import saebyeol.service.face.AttachService;

@Service
public class AttachServiceImpl implements AttachService {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//DAO 객체 생성
	@Autowired AttachDao attachDao;
	
	@Override
	public List<AttachImage> getAttachList(int prodNo) {
		logger.info("--- getAttachList ---");
		return attachDao.getAttachList(prodNo);
	}

	
	
}
