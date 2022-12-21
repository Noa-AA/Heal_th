package changmin.service.face;

import java.util.List;

import changmin.dto.MyMessage;

public interface MessageService {

	public List<MyMessage> getMessageList(int userno);

	public void pushMessage(MyMessage myMessage);

}
