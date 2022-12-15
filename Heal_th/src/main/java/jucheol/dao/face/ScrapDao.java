package jucheol.dao.face;

import jucheol.dto.Scrap;

public interface ScrapDao {

	/**
	 * 회원번호를 받고 글을 저장
	 * 
	 * @param scrap
	 */
	public void addScrap(Scrap scrap);

}
