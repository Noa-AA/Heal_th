package hyunkyung.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChlJoinDao;
import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChlJoinService;

@Service
public class ChlJoinServiceImpl implements ChlJoinService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ChlJoinDao chlJoinDao;
	
	@Override
	public Challenge selectInfo(Challenge challenge) {
		logger.info("selectInfo() -{}", challenge);
//		logger.info("selectInfo() -{}", joinParam);
		
		return chlJoinDao.selectChlInfo(challenge);
	}

}
