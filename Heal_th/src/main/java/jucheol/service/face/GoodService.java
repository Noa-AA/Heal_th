package jucheol.service.face;

import jucheol.dto.Good;

public interface GoodService {

	/**
	 * 이미 좋아요를 했는지 체크
	 * 
	 * @param good
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
	 * 좋아요 정보 찾기
	 * 
	 * @param good
	 */
	public Good selectGood(Good good);

	

}
