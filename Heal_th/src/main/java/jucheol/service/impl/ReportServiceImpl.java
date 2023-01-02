package jucheol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jucheol.dao.face.CommentDao;
import jucheol.dao.face.ReportDao;
import jucheol.dto.Comment;
import jucheol.dto.Report;
import jucheol.service.face.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//DAO 객체
	@Autowired ReportDao reportDao;
	
	@Override
	public Report reportCheck(Report report) {
		return reportDao.reportCheck(report);
	}

	@Override
	public void addReport(Report report) {
		reportDao.addReport(report);
	}

	@Override
	public void deleteReport(Report report) {
		reportDao.deleteReport(report);
	}

	@Override
	public List<Report> selectList(Report report) {
		return reportDao.selectList(report);
	}
	
	//DAO 객체
	@Autowired CommentDao commentDao;
	@Override
	public void deletePost(Report report) {
		report = reportDao.selectOne(report);
		logger.info("deletePost - {}",report);
		reportDao.deletePost(report);
		reportDao.deleteReport(report);
		
		Comment comment = new Comment();
		comment.setBoardNo(report.getBoardNo());
		comment.setCategoryNo(report.getCategoryNo());
		commentDao.deleteComment(comment);
	}


}
