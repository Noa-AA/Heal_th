package hyanghee.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.DietBoardDao;
import hyanghee.service.face.DietBoardService;

@Service
public class DietBoardServiceImpl implements DietBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired DietBoardDao dietBoardDao;
	
}
