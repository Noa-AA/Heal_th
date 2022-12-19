package daeyeon.dao.face;

import java.util.List;

import daeyeon.util.AdminPaging;
import yerim.dto.Users;

public interface AdminUserDao {

	/**
	 * admin/user 
	 *
	 * 페이징을 위한 회원 리스트 개수조회
	 * 
	 * @return - 조회된 전체 리스트 개수
	 */
	public int selectCntAll();

	/**
	 * admin/user
	 * 
	 * @param adminPaging - 페이징 정보
	 * @return - 조회된 회원 리스트
	 */
	public List<Users> selectUsers(AdminPaging adminPaging);

	
	/**
	 * 검색
	 * 
	 * @return
	 */
	public int selectSearchCntAll(AdminPaging adminPaging);

	public List<Users> selectSearchUsers(AdminPaging adminPaging);


	
}
