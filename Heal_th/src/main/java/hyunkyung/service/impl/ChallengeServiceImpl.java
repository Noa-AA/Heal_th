package hyunkyung.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChallengeDao;
import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeFile;
import hyunkyung.service.face.ChallengeService;
import hyunkyung.util.ChlCriteria;

@Service
public class ChallengeServiceImpl implements ChallengeService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChallengeDao challengeDao;

	//챌린지 목록
	@Override
	public List<Challenge> getList() {

		return challengeDao.getList();
	}

	//챌린지 목록(페이징 적용)
	@Override
	public List<Challenge> getListPaging(ChlCriteria cri) {
		return challengeDao.getListPaging(cri);
	}
	
	//챌린지 상세보기
	@Override
	public Challenge getPage(int challengeNo) {

		return challengeDao.getPage(challengeNo);
	}

	//챌린지 총 갯수
	@Override
	public int getTotal(ChlCriteria cri) {
		return challengeDao.getTotal(cri);
	}

}
