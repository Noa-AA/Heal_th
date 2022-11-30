package changmin.service.face;

import java.util.List;

import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import yerim.dto.Users;

public interface DgMoneyService {

	/**
	 * 득근머니 잔액 조회
	 * @param userno
	 * @return
	 */
	public int getMmoney(int userno);

	/**
	 * 득근머니 충전 기록
	 * @param mmoneyPay
	 */
	public void addMmoney(MmoneyPay mmoneyPay);

	/**
	 * 유저정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);

	/**
	 * 득근머니 충전
	 * @param mmoneyPay
	 */
	public void chargeMmoney(MmoneyPay mmoneyPay);

	/**
	 * 인출신청내역 DB에 저장
	 * @param withDraw
	 */
	public void addWithDraw(WithDraw withDraw);

	/**
	 * 관리자 - 인출신청리스트 불러오기
	 * @return
	 */
	public List<WithDraw> getWithDrawList();

}
