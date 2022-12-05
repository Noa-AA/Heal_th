package changmin.dao.face;

import java.util.List;

import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import changmin.util.AdminWithDrawPaging;
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

	/**
	 * 득근머니 충전후 유저정보의 득근머니 수정
	 * @param mmoneyPay
	 */
	public void updateDgmoney(MmoneyPay mmoneyPay);

	/**
	 * 인출신청내역 삽입
	 * @param withDraw
	 */
	public void insertWithDraw(WithDraw withDraw);

	/**
	 * 인출신청내역 처리후 처리상태 변경
	 * @param wd
	 */
	public void updateWdProcess(WithDraw wd);

	/**
	 * 인출신청내역 처리시 유저의 득근머니 수정 
	 * @param wd
	 */
	public void updateDgmoneybyAdmin(WithDraw wd);

	/**
	 * 유저의 인출신청내역 갯수 조회 
	 * @param userno
	 * @return
	 */
	public int selectWithDrawCnt(int userno);

	/**
	 * 전체 인출신청내역 갯수 조회
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 전체 인출신청내역 갯수를 페이징하여 인출신청내역 조회
	 * @param wdPaging
	 * @return
	 */
	public List<WithDraw> selectWithDrawList(AdminWithDrawPaging wdPaging);

}
