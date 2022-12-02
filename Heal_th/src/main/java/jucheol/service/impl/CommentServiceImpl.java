package jucheol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jucheol.dao.face.CommentDao;
import jucheol.dto.Comment;
import jucheol.service.face.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//DAO 객체
	@Autowired CommentDao commentDao;
	
	@Override
	public List<Comment> insertComment(Comment comment) {
//		logger.info("comment : {}",comment);
		
		commentDao.insertComment(comment);
		
		return commentDao.selectList(comment);
	}

	@Override
	public List<Comment> list(Comment comment) {
		return commentDao.selectList(comment);
		
	}

	@Override
	public List<Comment> deleteComment(Comment comment) {
		
		commentDao.deleteComment(comment);
		logger.info("deletecomment : {}",comment);

		return commentDao.selectList(comment);
	}

}
