package hyunkyung.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChallengeDao;
import hyunkyung.service.face.ChallengeService;

@Service
public class ChallengeServiceImpl implements ChallengeService{

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO객체
	@Autowired ChallengeDao challengeDao;
}
