package unhak.dao.face;

import unhak.dto.PaymentDto;
import yerim.dto.Users;

public interface PaymentDao {

	
	
	/**
	 * 유저번호에 따른 유저정보 데이터조회
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);

	public void insertPayment(PaymentDto payment);

	
	
}
