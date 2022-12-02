package jucheol.service.face;

import java.util.List;

import jucheol.dto.Comment;

public interface CommentService {

	/**
	 *  댓글 정보를 등록한다
	 * 
	 * @param comment
	 * @return 
	 */
	public List<Comment> insertComment(Comment comment);

	/**
	 * 	댓글 리스트를 불러온다
	 * 
	 * @param comment
	 * @return 
	 */
	public List<Comment> list(Comment comment);

	/**
	 * 댓글을 삭제한다
	 * 
	 * @param comment 댓글번호
	 * @return 
	 */
	public List<Comment> deleteComment(Comment comment);

}
