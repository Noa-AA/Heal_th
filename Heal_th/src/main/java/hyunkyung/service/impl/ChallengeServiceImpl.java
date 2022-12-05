package hyunkyung.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChallengeDao;
import hyunkyung.dto.Challenge;
import hyunkyung.service.face.ChallengeService;
import hyunkyung.util.Paging;

@Service
public class ChallengeServiceImpl implements ChallengeService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ChallengeDao challengeDao;

	@Override
	public Paging getPaging(int curPage) {

		// 총 게시글 수 조회
		int totalCount = challengeDao.selectCntAll();

		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	@Override
	public List<Challenge> list(Paging paging) {
		return challengeDao.selectList(paging);
	}

	@Override
	public Challenge view(Challenge viewChallenge) {
		// 조회수 관련된것도 넣기, 컬럼도 추가

		// 상세보기 조회결과 리턴
		return challengeDao.selectChallenge(viewChallenge);
	}

}
