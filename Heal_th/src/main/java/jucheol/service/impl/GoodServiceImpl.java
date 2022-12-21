package jucheol.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jucheol.dao.face.GoodDao;
import jucheol.dto.Good;
import jucheol.service.face.GoodService;

@Service
public class GoodServiceImpl implements GoodService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//DAO 객체
	@Autowired GoodDao goodDao;
	
	@Override
	public Good goodCheck(Good good) {
		return goodDao.goodCheck(good);
	}

	@Override
	public void addGood(Good good) {
		goodDao.upGood(good);
		goodDao.addGood(good);
		
	}

	@Override
	public void deleteGood(Good good) {
		logger.info("downgood1 - {}",good);
		goodDao.downGood(good);
		logger.info("downgood2 - {}",good);
		goodDao.deleteGood(good);
	}

	@Override
	public Good selectGood(Good good) {
		return goodDao.selectGood(good);
	}

}
