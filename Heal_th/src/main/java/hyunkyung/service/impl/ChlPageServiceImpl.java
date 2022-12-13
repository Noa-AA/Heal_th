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

	//챌린지 정보 조회
	@Override
	public Challenge selectChlInfo(Challenge challenge) {
		return chlPageDao.selectChlInfo(challenge);
	}

	//참여자 목록 조회
	@Override
	public ParticipantList selectPList(ParticipantList participantList) {
		return chlPageDao.selectPInfo(participantList);
	}




}
