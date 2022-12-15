package jucheol.dao.face;

import java.util.List;

import jucheol.dto.Scrap;

public interface ScrapDao {

	/**
	 * 회원번호를 받고 글을 저장
	 * 
	 * @param scrap
	 */
	public void addScrap(Scrap scrap);

	/**
	 * 스크랩 목록 불러오기
	 * 
	 * @param scrap 회원번호, 글번호, 카테고리번호
	 * @return 
	 */
	public List<Scrap> selectList(Scrap scrap);

}
