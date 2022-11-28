package yerim.dao.face;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import yerim.dto.Users;

public interface LoginDao {
	
	/**
	 * 회원가입 정보 DB에 저장하기
	 * @param joinInfo
	 */
	
	public void insertJoinInfo(Users joinInfo);
	
	
}
