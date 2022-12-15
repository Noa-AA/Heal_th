package hyunkyung.service.face;



import java.util.List;

import hyunkyung.dto.Challenge;
import yerim.dto.Users;

public interface ChlPageService {

	/**
	 * 유저 정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);


	/**
	 * 가입한 챌린지 리스트
	 * @param userno - 유저 번호 이용
	 * @return
	 */
	public List<Challenge> getList(int userno);

	/**
	 * 내가 가입한 챌린지 총 갯수
	 * @return
	 */
//	public Challenge getTotal(int userno);



	
	
	
	
	
	
	

	
	
	
	





}
