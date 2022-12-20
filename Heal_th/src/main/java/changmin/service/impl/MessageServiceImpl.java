package changmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.dao.face.MessageDao;
import changmin.dto.MyMessage;
import changmin.service.face.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired MessageDao messageDao;
	
	@Override
	public List<MyMessage> getMessageList(int userno) {
		
		return messageDao.selectMessageList(userno);
	}

	@Override
	public void pushMessage(MyMessage myMessage) {

		messageDao.insertMessage(myMessage);
	}

	
}
