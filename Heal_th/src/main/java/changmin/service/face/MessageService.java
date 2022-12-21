package changmin.service.face;

import java.util.List;

import changmin.dto.MyMessage;

public interface MessageService {

	/**
	 * 회원번호에 따른 메시지목록 조회
	 * @param userno
	 * @return
	 */
	public List<MyMessage> getMessageList(int userno);

	/**
	 * 회원에게 메시지 전달
	 * @param myMessage
	 */
	public void pushMessage(MyMessage myMessage);

}
