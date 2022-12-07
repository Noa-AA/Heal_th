package hyanghee.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.ReviewBoardDao;
import hyanghee.dto.ReviewBoard;
import hyanghee.service.face.ReviewBoardService;
import hyanghee.util.BoardPaging;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Override
	public BoardPaging getPaging(int curPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewBoard> list(BoardPaging boardPaging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReview(ReviewBoard reviewBoard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReviewBoard view(ReviewBoard viewBoard) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ReviewBoard reviewBoard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ReviewBoard reviewNo) {
		// TODO Auto-generated method stub
		
	}


	
	
}
