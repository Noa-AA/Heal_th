package hyunkyung.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.CreateDao;
import hyunkyung.dto.Challenge;
import hyunkyung.service.face.CreateService;

@Service
public class CreateServiceImpl implements CreateService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	CreateDao createDao;

	@Override
	public void create(Challenge challenge) {
		logger.info("create()- {}", challenge);

		createDao.insert(challenge);
	}

}
