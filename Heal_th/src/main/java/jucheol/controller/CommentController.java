package jucheol.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jucheol.dto.Comment;
import jucheol.service.face.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private CommentService commentService;
	
	@GetMapping("/board")
	public void comBoard(
			Model model
			, Comment comment
			) {
		logger.info("/comment/board [GET]");
		comment.setBoardNo(1);
		comment.setCategoryNo(1);
		List<Comment> commentList = commentService.list(comment);
		
		for( Comment c : commentList ) logger.info("{}",c);
		
		//모델값 전달
		model.addAttribute("commentList", commentList);
	}

	
	@GetMapping("/list")
	public String comList(
			Comment comment
			, int category
			, int boardno
			, Model model
			, HttpSession session
			) {
		logger.info("/comment/list [GET]");

		comment.setCategoryNo(category);
		comment.setBoardNo(boardno);
		logger.info("comment : {}",comment);
		
		List<Comment> commentList = commentService.list(comment);
		
		for( Comment c : commentList ) logger.info("list-{}",c);
		
		//모델값 전달
		model.addAttribute("commentList", commentList);
		return "comment/list";
	}
	

	@PostMapping("/insert")
	public String comInsert(
			String content
			, Comment comment
			, int category
			, int boardno
			, Model model
			, HttpSession session
			) {
		logger.info("/comment/insert [POST]");

		session.setAttribute("userNo", 7777);

		comment.setUserNo((int)session.getAttribute("userNo"));
		comment.setCommentContent(content);
		comment.setCategoryNo(category);
		comment.setBoardNo(boardno);
		
		logger.info("comment : {}",comment);
		
		List<Comment> commentList = commentService.insertComment(comment);

		for( Comment c : commentList ) logger.info("post-{}",c);
		
		//모델값 전달
		model.addAttribute("commentList", commentList);
//		return "comment/board";
		return "comment/list";
	}
	
	@PostMapping("/delete")
	public String comDelete(
			int commentno
			, int category
			, int boardno
			, Comment comment
			, Model model
			) {
		comment.setCommentNo(commentno);
		comment.setCategoryNo(category);
		comment.setBoardNo(boardno);
		
		logger.info("/delete[POST]");
		List<Comment> commentList = commentService.deleteComment(comment);

		for( Comment c : commentList ) logger.info("delete-{}",c);

		//모델값 전달
		model.addAttribute("commentList", commentList);
//		return "comment/board";
		return "comment/list";
	}
	
	
}
