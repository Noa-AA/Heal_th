package hyunkyung.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChlJoinDao;
import hyunkyung.dto.Challenge;
import hyunkyung.dto.MmoneyUse;
import hyunkyung.dto.ParticipantList;
import hyunkyung.service.face.ChlJoinService;
import yerim.dto.Users;

@Service
public class ChlJoinServiceImpl implements ChlJoinService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ChlJoinDao chlJoinDao;
	
	//챌린지 정보 조회
	@Override
	public Challenge selectInfo(int challengeNo) {
		return chlJoinDao.selectChlInfo(challengeNo);
	}

	
	//유저 정보 조회
	@Override
	public Users getUserInfo(int userno) {
		return chlJoinDao.selectUserInfo(userno);
	}

//	//득근머니 잔액 조회
//	@Override
//	public int getMmoney(int userno) {
//		return chlJoinDao.selectMmoney(userno);
//	}


	
	//가입시 정보저장
	@Override
	public int insert(ParticipantList pList) {
		logger.info("pList() -{}", pList);
		
		return chlJoinDao.insertInfo(pList);
	}


	@Override
	public MmoneyUse getMmoney(int userno) {
		return chlJoinDao.selectMmoney(userno);
	}






}
