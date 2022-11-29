package changmin.dao.face;

import changmin.dto.MmoneyPay;
import yerim.dto.Users;

public interface DgMoneyDao {

	public int selectDgmoney(int userno);

	public void insertDgmoney(MmoneyPay mmoneyPay);

	public Users selectUserInfo(int userno);

	public void updateDgmoney(MmoneyPay mmoneyPay);


}
