package hyunkyung.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChlCreateDao;
import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlCreateService;

@Service
public class ChlCreateServiceImpl implements ChlCreateService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ChlCreateDao createDao;

	@Override
	public void create(Challenge challenge) {
		logger.info("create()- {}", challenge);

		createDao.insert(challenge);
	}

}
