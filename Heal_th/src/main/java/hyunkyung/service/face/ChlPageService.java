package hyunkyung.service.face;



import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeContent;
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
	 * 사진인증 페이지로 이동
	 * @param challengeNo
	 * @return
	 */
	public Challenge getPage(int challengeNo);

	
	/**
	 * 인증한 사진들 리스트
	 * @param challengeNo
	 * @return
	 */
	public List<ChallengeContent> getPhoto(int challengeNo);

	
	/**
	 * 인증용 사진 upload 하기 
	 * @param chlPhoto - 사진 파일
	 * @param chlFile
	 */
	public void upload(MultipartFile[] chlPhoto, Map<String, Object> data);


	
	
	




	
	
	
	
	
	
	

	
	
	
	





}
