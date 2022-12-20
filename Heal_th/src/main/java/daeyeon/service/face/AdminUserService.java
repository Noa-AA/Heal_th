package daeyeon.service.face;

import java.util.List;

import daeyeon.util.AdminPaymentPaging;
import daeyeon.util.AdminUserPaging;
import unhak.dto.PaymentDto;
import yerim.dto.Users;

public interface AdminUserService {


//	회원 목록 -----------------------------------------------------------------
	
	/**
	 * admin/user
	 * 
	 * 관리자 회원페이지의 페이지 정보
	 * 
	 * @param curPage
	 * @return - 페이징 정보
	 */
	public AdminUserPaging getUserPaging(String curPage);

	
	/**
	 * admin/user
	 * 
	 * @param adminPaging - 페이징 객체
	 * @return - 조회되 유저 정보
	 */
	public List<Users> getUserList(AdminUserPaging adminUserPaging);


	
	/**
	 * 관리자 회원목록의 검색 페이지 정보
	 * 
	 * @param adminPaging
	 * @return
	 */
	public AdminUserPaging getSearchPaging(AdminUserPaging adminUserPaging, String curPage);


	/**
	 * 검색된 회원목록
	 * 
	 * @param adminUserPaging
	 * @return
	 */
	public List<Users> userSearchlist(AdminUserPaging adminUserPaging);

	
	
//	회원 결제목록 -----------------------------------------------------------------

	/**
	 * 결제목록을 위한 페이징 정보
	 * 
	 * @param curPage
	 * @return
	 */
	public AdminPaymentPaging getPaymentPaging(String curPage);


	/**
	 * admin/payment
	 * 
	 * @param adminPaging - 페이징 객체
	 * @return - 조회되 결제목록 정보
	 */
	public List<PaymentDto> getPaymentList(AdminPaymentPaging adminPaymentPaging);


	/**
	 * 관리자 결제목록의 검색 페이지 정보
	 * 
	 * @param adminPaymentPaging
	 * @param curPage
	 * @return
	 */
	public AdminPaymentPaging getPaymentSearchPaging(AdminPaymentPaging adminPaymentPaging, String curPage);

	
	/**
	 * 검색한 결제목록
	 * 
	 * @param adminPaymentPaging
	 * @return
	 */
	public List<PaymentDto> paymentSearchlist(AdminPaymentPaging adminPaymentPaging);



	

	

}
