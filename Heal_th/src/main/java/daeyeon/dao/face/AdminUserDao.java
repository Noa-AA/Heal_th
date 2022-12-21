package daeyeon.dao.face;

import java.util.List;

import daeyeon.util.AdminPaymentPaging;
import daeyeon.util.AdminUserPaging;
import unhak.dto.PaymentDto;
import yerim.dto.Users;

public interface AdminUserDao {

	/**
	 * admin/user 
	 *
	 * 페이징을 위한 회원 리스트 개수조회
	 * 
	 * @return - 조회된 전체 리스트 개수
	 */
	public int selectUserCntAll();

	/**
	 * admin/user
	 * 
	 * @param adminPaging - 페이징 정보
	 * @return - 조회된 회원 리스트
	 */
	public List<Users> selectUsers(AdminUserPaging adminUserPaging);

	
	/**
	 * 페이징을 위한 검색 회원 리스트 수 조회
	 * 
	 * @return
	 */
	public int selectSearchCntAll(AdminUserPaging adminUserPaging);

	/**
	 * 페이징된 회원 리스트 정보
	 * 
	 * @param adminUserPaging
	 * @return
	 */
	public List<Users> selectSearchUsers(AdminUserPaging adminUserPaging);

	
	//	회원 결제목록 -----------------------------------------------------------------
	
	/**
	 * admin/payment 
	 *
	 * 페이징을 위한 결제목록 개수조회
	 * 
	 * @return - 조회된 결제목록 전체 리스트 개수
	 */
	public int selectPaymentCntAll();

	
	/**
	 * admin/payment
	 * 
	 * @param adminPaging - 페이징 정보
	 * @return - 조회된 결제 목록리스트
	 */
	public List<PaymentDto> selectPayment(AdminPaymentPaging adminPaymentPaging);

	/**
	 * admin/payment
	 * 
	 * @param adminPaymentPaging
	 * @return
	 */
	public int selectPaymentSearchCntAll(AdminPaymentPaging adminPaymentPaging);

	
	/**
	 * admin/payment
	 * 
	 * 검색된 결제목록
	 * 
	 * @param adminPaymentPaging
	 * @return
	 */
	public List<PaymentDto> selectSearchPayment(AdminPaymentPaging adminPaymentPaging);


	
}
