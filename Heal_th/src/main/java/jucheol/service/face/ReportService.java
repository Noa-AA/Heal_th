package jucheol.service.face;

import java.util.List;

import jucheol.dto.Report;

public interface ReportService {

	/**
	 * 신고중인지 확인
	 * 
	 * @param report
	 * @return
	 */
	public Report reportCheck(Report report);

	/**
	 * 글을 신고
	 * 
	 * @param report 신고자회원번호, 글번호, 카테고리번호
	 */
	public void addReport(Report report);

	/**
	 * 신고 취소하기
	 * 
	 * @param reportNo 취소할 신고 번호
	 */
	public void deleteReport(Report report);

	/**
	 * 신고목록 불러오기
	 * 
	 * @param report 신고한 회원번호, 글번호, 카테고리번호
	 * @return
	 */
	public List<Report> selectList(Report report);

	/**
	 * 게시글 삭제하기
	 * @param report
	 */
	public void deletePost(Report report);



}
