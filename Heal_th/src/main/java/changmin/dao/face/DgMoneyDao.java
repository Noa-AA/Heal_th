package changmin.dao.face;

import java.util.List;

import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import yerim.dto.Users;

public interface DgMoneyDao {

	/**
	 * 득근머니 데이터 조회
	 * @param userno
	 * @return
	 */
	public int selectDgmoney(int userno);

	/**
	 * 득근머니 데이터 삽입
	 * @param mmoneyPay
	 */
	public void insertDgmoney(MmoneyPay mmoneyPay);

	/**
	 * 유저번호에 따른 유저정보 데이터 조회
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);

	public void updateDgmoney(MmoneyPay mmoneyPay);

	public void insertWithDraw(WithDraw withDraw);

	public List<WithDraw> selectWithDrawList();

	public void updateWdProcess(WithDraw wd);

	public void updateDgmoneybyAdmin(WithDraw wd);

	public int selectWithDrawCnt(int userno);


}
