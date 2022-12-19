package hyunkyung.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChlPageDao;
import hyunkyung.dto.Challenge;
import hyunkyung.dto.ParticipantList;
import hyunkyung.service.face.ChlPageService;
import yerim.dto.Users;

@Service
public class ChlPageServiceImpl implements ChlPageService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ChlPageDao chlPageDao;

	//유저 정보 조회
	@Override
	public Users getUserInfo(int userno) {
		return chlPageDao.selectUserInfo(userno);
	}

	//회원번호로 내가 가입한 챌린지 조회
	@Override
	public List<Challenge> getList(int userno) {

		List<Challenge> list = chlPageDao.selectjoinList(userno);
		
		for(Challenge c : list) logger.info("내가 가입한 챌린지{}", c);
		
		return list;
	}


//	@Override
//	public Challenge getTotal(int userno) {
//		return chlPageDao.getTotal(userno);
//	}


	
	
	

	
	
	
	
	
	
	
	




}
