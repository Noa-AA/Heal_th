package jucheol.dao.face;

import jucheol.dto.Good;

public interface GoodDao {

	/**
	 * 이미 좋아요 했는지 확인
	 * 
	 * @param good
	 * @return
	 */
	public Good goodCheck(Good good);

	/**
	 * 좋아요 추가
	 * 
	 * @param good
	 */
	public void addGood(Good good);

	/**
	 * 좋아요 취소
	 * 
	 * @param good
	 */
	public void deleteGood(Good good);

	/**
	 * 게시글 좋아요 수 증가
	 * 
	 * @param good
	 */
	public void upGood(Good good);

	/**
	 * 게시글 좋아요 수 감소
	 * 
	 * @param good
	 */
	public void downGood(Good good);

	/**
	 * 좋아요 정보 찾기
	 * 
	 * @param good
	 */
	public Good selectGood(Good good);

}
