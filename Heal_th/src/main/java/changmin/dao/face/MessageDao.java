package changmin.dao.face;

import java.util.List;

import changmin.dto.MyMessage;

public interface MessageDao {

	/**
	 * 메시지목록 조회
	 * @param userno
	 * @return
	 */
	public List<MyMessage> selectMessageList(int userno);

	/**
	 * 현재 로그인한 회원에게 메시지정보 삽입
	 * @param myMessage
	 */
	public void insertMessage(MyMessage myMessage);

}
