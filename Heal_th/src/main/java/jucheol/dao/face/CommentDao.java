package jucheol.dao.face;

import java.util.List;

import jucheol.dto.Comment;

public interface CommentDao {

	/**
	 * 댓글 정보를 받아 등록
	 * 
	 * @param comment
	 */
	public void insertComment(Comment comment);

	/**
	 * 댓글 불러오기
	 * 
	 * @param comment
	 * @return
	 */
	public List<Comment> selectList(Comment comment);

	/**
	 * 댓글 삭제하기
	 * 
	 * @param comment 댓글번호
	 */
	public void deleteComment(Comment comment);

}
