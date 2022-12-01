package yerim.service.impl;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yerim.dao.face.JoinDao;
import yerim.dto.Msg;
import yerim.dto.Request;
import yerim.dto.SmsRequest;
import yerim.dto.SmsResponse;
import yerim.dto.Users;
import yerim.service.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService {
		
	@Autowired JoinDao loginDao;
		
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	private String accesskey = "r0IdZKsLWez0CewuKvdP";
	private String secretKey = "TiM1B0tHlHV4Pqss0XXSiRfa2MMbrCs7zOGZk6Be";
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
	public String sendRan(Users userPhone) {
		
		//난수 생성하기
		
		
		
		return null;
	}
	

}
