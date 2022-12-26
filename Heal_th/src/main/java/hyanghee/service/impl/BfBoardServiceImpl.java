package hyanghee.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyanghee.dao.face.BfBoardDao;
import hyanghee.dto.Beforeafter;
import hyanghee.service.face.BfBoardService;
import hyanghee.util.BoardPageMaker;
import hyanghee.util.BoardSearch;
import saebyeol.dto.Notice;
import yerim.dto.Users;

@Service
public class BfBoardServiceImpl implements BfBoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BfBoardDao bfBoardDao;
	
	//비포 애프터 게시글 생성
	@Override
	public void insertBfBoard(Beforeafter bfBoard) {
		
		bfBoardDao.insertBfBoard(bfBoard);
		
	}
	
	@Override
	public Beforeafter view(Beforeafter viewBoard) {
		
		//조회수 증가
		bfBoardDao.updateHit(viewBoard);
		
		return bfBoardDao.selectBoard(viewBoard);
	}

	//유저정보 찾기
	@Override
	public Users getUserInfo(int userno) {
		return bfBoardDao.selectUserInfo(userno);
	}

	//포인트 정보
	@Override
	public int getPoint(int userno) {
		return bfBoardDao.getPoint(userno);
	}

	//포인트 주기
	@Override
	public void updatePoint(int point) {
		Users users = new Users();
		
		users.setUserNo(point);
		bfBoardDao.updatePoint(users);
		
	}

	//게시글 수정
	@Override
	public void update(Beforeafter beforeafter) {
		if( "".equals( beforeafter.getBfTitle() ) ) {
			beforeafter.setBfTitle("(제목없음)");
		}
		
		bfBoardDao.updateBoard(beforeafter);
		
	}

	//게시글 삭제
	@Override
	public void delete(Beforeafter bfNo) {
		bfBoardDao.delete(bfNo);
		
	}

	//공지사항
	@Override
	public List<Notice> notice(BoardSearch boardSearch) {
		return bfBoardDao.notice(boardSearch);
	}

	//게시글 검색 / 목록
	@Override
	public List<Beforeafter> getSearchPaging(BoardSearch boardSearch) {
		return bfBoardDao.getSearchPaging(boardSearch);
	}

	//전체 게시글 보기
	@Override
	public int getTotal(BoardSearch boardSearch) {
		return bfBoardDao.getTotal(boardSearch);
	}

	@Override
	public String getUserNick(int userno) {
		return bfBoardDao.selectUserNick(userno);
	}



}

	
	

