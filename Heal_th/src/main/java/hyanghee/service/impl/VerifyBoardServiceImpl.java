package hyanghee.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.VerifyBoardDao;
import hyanghee.dto.VerifyBoard;
import hyanghee.service.face.VerifyBoardService;
import hyanghee.util.BoardPaging;

@Service
public class VerifyBoardServiceImpl implements VerifyBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired VerifyBoardDao verifyBoardDao;

	@Override
	public BoardPaging getPaging(int curPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VerifyBoard> list(BoardPaging boardPaging) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
