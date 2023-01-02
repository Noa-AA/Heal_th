package unhak.service.face;

import unhak.dto.PaymentDto;
import yerim.dto.Users;

public interface PaymentService {

	/**
	 * 유저 정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);

	public void savePayment(PaymentDto payment);


	

}
