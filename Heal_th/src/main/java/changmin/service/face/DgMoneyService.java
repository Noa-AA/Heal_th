package changmin.service.face;

import changmin.dto.MmoneyPay;
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

}
