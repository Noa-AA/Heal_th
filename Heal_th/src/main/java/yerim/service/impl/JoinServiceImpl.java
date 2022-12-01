package yerim.service.impl;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Random;

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
		Random ran = new Random();
		String numMsg ="";
		//6자리의 난수 생성하기
		for(int i=0;i<6;i++) {
			//0~9사의 난수값을 numMsg에 추가하기
			numMsg += Integer.toString(ran.nextInt(10));
		}
		logger.info("회원 문자 인증 숫자 " + numMsg);
		
		//네이버 클라우드 플랫폼 API 연결하기
		
		
		
		
		return numMsg;
	}
	

}
