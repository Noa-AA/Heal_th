package changmin.dao.face;

import java.util.List;

import changmin.dto.MyMessage;

public interface MessageDao {

	public List<MyMessage> selectMessageList(int userno);

	public void insertMessage(MyMessage myMessage);

}
