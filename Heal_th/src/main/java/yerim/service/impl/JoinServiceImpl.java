package yerim.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yerim.dao.face.JoinDao;
import yerim.dto.Msg;
import yerim.dto.SmsRequest;
import yerim.dto.SmsResponse;
import yerim.dto.Users;
import yerim.service.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService {
		
	@Autowired JoinDao loginDao;
		
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
		public void setJoinInfo(Users joinInfo) {
			loginDao.insertJoinInfo(joinInfo);

	}
	
	@Override
	public int checkById(Users chkId) {

		int chkResult = loginDao.selectBychkId(chkId);
		
		return chkResult;
	}
	
	
	@Override
	public SmsResponse sendSms(String recivedPhoneNumber, String content) {
			//경과시킨을 밀리초로 나타내므로 밀리초 시간 얻기
			Long time = System.currentTimeMillis();
			
			//메시지에 전달된 전화번호와 내용 넣기
			List<Msg> messages = new ArrayList<Msg>();
			messages.add(new Msg(recivedPhoneNumber,content));
			
			//문자요청
//			SmsRequest smsRequest = new SmsRequest("SMS","COMM","82","01035074177");
		
		
		
		return null;
	}
}
