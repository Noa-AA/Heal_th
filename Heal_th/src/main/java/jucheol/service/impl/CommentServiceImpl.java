package jucheol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jucheol.dao.face.CommentDao;
import jucheol.dto.Comment;
import jucheol.service.face.CommentService;
import yerim.dao.face.MypageDao;
import yerim.dto.PhotoFile;

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
	
	//MypageDao
	@Autowired MypageDao mypageDao;
	@Override
	public List<Comment> list(Comment comment) {
		List<Comment> list = commentDao.selectList(comment);
		for(int i=0; i<list.size(); i++) {
			PhotoFile profile = new PhotoFile();
			profile.setUserNo(list.get(i).getUserNo());
			profile = mypageDao.selectStoredName(profile);
			if(profile !=null ) {
				list.get(i).setProfileStoreName(profile.getStoredName());
			}
		}
		return list;
		
	}

	@Override
	public List<Comment> deleteComment(Comment comment) {
//		comment.setBoardNo(0);		//-------추가
//		comment.setCategoryNo(0); //---------추가
		commentDao.deleteComment(comment);	//---추가
		logger.info("deletecomment : {}",comment);

		return commentDao.selectList(comment);
	}

}
