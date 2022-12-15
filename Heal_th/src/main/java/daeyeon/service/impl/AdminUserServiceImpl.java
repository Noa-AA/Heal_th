package daeyeon.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daeyeon.dao.face.AdminUserDao;
import daeyeon.service.face.AdminUserService;
import daeyeon.util.AdminPaging;
import yerim.dto.Users;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired AdminUserDao adminUserDao;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
//	/admin/user
	@Override
	public AdminPaging getUserPaging(String curPage) {
		logger.info("getUserPaging");
		
		//총 게시글 수 조회하기
		int totalCount = adminUserDao.selectCntAll();
						
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}

		//DgHelperPaging객체 생성
		AdminPaging adminPaging = new AdminPaging(totalCount, curPage2);
						
		return adminPaging;
	}
	
	
	@Override
	public List<Users> getUserList(AdminPaging adminPaging) {
		logger.info("getUserList");
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> userList = adminUserDao.selectUsers(adminPaging); 
				
		return userList;
		
	}
	
	
	
	
}






