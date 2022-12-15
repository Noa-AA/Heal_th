package jucheol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jucheol.dao.face.ScrapDao;
import jucheol.dto.Scrap;
import jucheol.service.face.ScrapService;

@Service
public class ScrapServiceImpl implements ScrapService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//DAO 객체
	@Autowired ScrapDao scrapDao;
		
	@Override
	public void addScrap(Scrap scrap) {
		scrapDao.addScrap(scrap);
	}

	@Override
	public List<Scrap> selectList(Scrap scrap) {
		
		return scrapDao.selectList(scrap);
		
	}

}
