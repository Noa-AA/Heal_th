package daeyeon.service.face;

import java.util.List;

import daeyeon.util.AdminPaging;
import yerim.dto.Users;

public interface AdminUserService {


	/**
	 * admin/user
	 * 
	 * 관리자 회원페이지의 페이지 정보
	 * 
	 * @param curPage
	 * @return - 페이징 정보
	 */
	public AdminPaging getUserPaging(String curPage);

	
	/**
	 * admin/user
	 * 
	 * @param adminPaging - 페이징 객체
	 * @return - 조회되 유저 정보
	 */
	public List<Users> getUserList(AdminPaging adminPaging);


	
	
	/**
	 * 검색  되라~~~
	 * 
	 * @param adminPaging
	 * @return
	 */
	public AdminPaging getSearchPaging(AdminPaging adminPaging, String curPage);


	
	public List<Users> userSearchlist(AdminPaging adminPaging);



	

	

}
