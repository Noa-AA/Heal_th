package hyanghee.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.ReviewBoardDao;
import hyanghee.service.face.ReviewBoardService;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ReviewBoardDao reviewBoardDao;
	
}
