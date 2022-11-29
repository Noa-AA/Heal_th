package changmin.service.face;

import changmin.dto.MmoneyPay;
import yerim.dto.Users;

public interface DgMoneyService {

	public int getMmoney(int userno);

	public void addMmoney(MmoneyPay mmoneyPay);

	public Users getUserInfo(int userno);

	public void chargeMmoney(MmoneyPay mmoneyPay);

}
