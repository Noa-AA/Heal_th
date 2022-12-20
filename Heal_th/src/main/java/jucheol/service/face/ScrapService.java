package jucheol.service.face;

import java.util.List;

import jucheol.dto.Scrap;

public interface ScrapService {

	/**
	 * 회원번호를 받고 글을 저장
	 * 
	 * @param scrap 회원번호, 글번호, 카테고리번호
	 */
	public void addScrap(Scrap scrap);

	/**
	 * 스크랩 목록 불러오기
	 * 
	 * @param scrap 회원번호, 글번호, 카테고리번호
	 * @return 
	 */
	public List<Scrap> selectList(Scrap scrap);
	
	/**
	 * 스크랩 삭제하기
	 * 
	 * @param scrapNo 삭제할 스크랩 번호
	 */
	public void deleteScrap(int scrapNo);

	/**
	 * 스크랩중인지 확인
	 * 
	 * @param scrap
	 * @return 
	 */
	public Scrap scrapCheck(Scrap scrap);

}
