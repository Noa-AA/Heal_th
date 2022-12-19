package hyunkyung.service.face;

import hyunkyung.dto.Challenge;
import yerim.dto.Users;

public interface ChlCreateService {

	/**
	 * 챌린지 만들기
	 * 챌린지 정보 insert하기
	 * @param challenge - 입력될 챌린지 정보
	 */
	public void create(Challenge challenge);



}
