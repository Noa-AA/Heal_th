package hyunkyung.dao.face;

import hyunkyung.dto.Challenge;

public interface ChlCreateDao {

	/**
	 * 신규 챌린지 방 삽입하기
	 * 
	 * @param challenge - 신규 생성 방 정보
	 */
	public void insertChl(Challenge challenge);


}
