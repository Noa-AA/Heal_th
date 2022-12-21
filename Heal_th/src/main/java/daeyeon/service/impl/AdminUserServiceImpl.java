package daeyeon.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daeyeon.dao.face.AdminUserDao;
import daeyeon.service.face.AdminUserService;
import daeyeon.util.AdminPaymentPaging;
import daeyeon.util.AdminUserPaging;
import unhak.dto.PaymentDto;
import yerim.dto.Users;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired AdminUserDao adminUserDao;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
//	/admin/user
	@Override
	public AdminUserPaging getUserPaging(String curPage) {
		logger.info("getUserPaging");
		
		//총 게시글 수 조회하기
		int totalCount = adminUserDao.selectUserCntAll();
						
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}

		//DgHelperPaging객체 생성
		AdminUserPaging adminUserPaging = new AdminUserPaging(totalCount, curPage2);
						
		return adminUserPaging;
	}
	
	
	@Override
	public List<Users> getUserList(AdminUserPaging adminUserPaging) {
		logger.info("getUserList");
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> userList = adminUserDao.selectUsers(adminUserPaging); 
				
		return userList;
		
	}
	
	
	
	// 검색된 게시글수 조회
	@Override
	public AdminUserPaging getSearchPaging(AdminUserPaging adminPaging, String curPage) {
		logger.info("getSearchPaging");
		
		//총 게시글 수 조회하기
		int totalCount = adminUserDao.selectSearchCntAll(adminPaging);
						
		logger.info("totalCount : {}", totalCount);
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}

		//AdminPaging객체 생성
		AdminUserPaging adminPagingResult = new AdminUserPaging(totalCount, curPage2);
						
		return adminPagingResult;
	}
	
	
	
	@Override
	public List<Users> userSearchlist(AdminUserPaging adminUserPaging) {
		
		logger.info("adminUserPaging () - {}", adminUserPaging);
		
		//게시글 목록 조회 - ChatDao 이용
		List<Users> searchList = adminUserDao.selectSearchUsers(adminUserPaging); 
				
		logger.info("searchList : {}", searchList);
		
		return searchList;
	}
	
	
	//	회원 결제목록 -----------------------------------------------------------------
	
	//admin/payment
	//결제목록 페이징을 위한 페이징 정보
	@Override
	public AdminPaymentPaging getPaymentPaging(String curPage) {
		logger.info("getPaymentPaging");
		
		//총 게시글 수 조회하기
		int totalCount = adminUserDao.selectPaymentCntAll();
						
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}

		//DgHelperPaging객체 생성
		AdminPaymentPaging adminPaymentPaging = new AdminPaymentPaging(totalCount, curPage2);
						
		return adminPaymentPaging;
	}
	
	
	@Override
	public List<PaymentDto> getPaymentList(AdminPaymentPaging adminPaymentPaging) {
		logger.info("getPaymentList");
		
		//게시글 목록 조회 - ChatDao 이용
		List<PaymentDto> paymentList = adminUserDao.selectPayment(adminPaymentPaging); 
		logger.info("DAO !! - paymentList : {}", paymentList);
				
		return paymentList;
	}
	
	
	@Override
	public AdminPaymentPaging getPaymentSearchPaging(AdminPaymentPaging adminPaymentPaging, String curPage) {
		logger.info("getPaymentSearchPaging");
		
		//총 게시글 수 조회하기
		int totalCount = adminUserDao.selectPaymentSearchCntAll(adminPaymentPaging);
						
		logger.info("totalCount : {}", totalCount);
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}

		//AdminPaging객체 생성
		AdminPaymentPaging adminPaymentPagingResult = new AdminPaymentPaging(totalCount, curPage2);
						
		return adminPaymentPagingResult;
	}
	
	//검색한 결제목록
	@Override
	public List<PaymentDto> paymentSearchlist(AdminPaymentPaging adminPaymentPaging) {
		logger.info("adminPaymentPaging () - {}", adminPaymentPaging);
		
		//게시글 목록 조회 - ChatDao 이용
		List<PaymentDto> searchPaymentList = adminUserDao.selectSearchPayment(adminPaymentPaging); 
				
		logger.info("searchPaymentList : {}", searchPaymentList);
		
		return searchPaymentList;
	}

	
	
	
}






