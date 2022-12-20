package yerim.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import changmin.dto.BodyInfo;
import yerim.dao.face.MypageDao;
import yerim.dto.PhotoFile;
import yerim.dto.Users;
import yerim.service.face.MypageService;
import yerim.util.EmailCode;
import yerim.util.Sms;

@Service
public class MypageServiceImpl implements MypageService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//Dao
	@Autowired MypageDao mypageDao;
	
	//이메일 보내기위한 객체
	@Autowired EmailCode emailCode;

	@Autowired ServletContext context;
	@Override
	public Users getuserInfo(int userNo) {
		logger.info("getuserInfo - userNo :{}",userNo);
		
		return mypageDao.selectUserInfo(userNo);
	}

	@Override
	public String sendEmailCode(Users userEmail) {
		
		return emailCode.sendEmailCode(userEmail);
	}
	@Override
	public boolean chkEmailCode(HttpSession session, String emailCode) {

		//세션에 담긴 코드
		String sessionCdoe = (String)session.getAttribute("sessionEmailCdoe");
		logger.info("session : {}, emailCode : {}",sessionCdoe,emailCode);

		//검증하기
		if(sessionCdoe.equals(emailCode)) {
			logger.info("코드 일치");
			//세션 지우기
			session.removeAttribute("sessionEmailCdoe");
			return true;
		}
		
		logger.info("코드 불일치");
		return false;
	}
	
	@Override
	public String sendSmsCode(Users userPhone) {
		
		Random ranNum = new Random();
		
		String msgNum = "";
		//6자리 난수 생성하기
		for( int i=0;i<6;i++) {
				//0~9사이의 난수값 추가하기
			msgNum += Integer.toString(ranNum.nextInt(10));
		}
		
		logger.info("인증번호 생성 : {}", msgNum);
		
		logger.info("문자 보내기 시작");
		Sms sms = new Sms();
		sms.sendSms((String)userPhone.getUserPhone(), msgNum);
		logger.info("문자 보내기 끝");
		
		
		return msgNum;
	}
	@Override
	public boolean chkSmsCode(HttpSession session, String smsCode) {
		logger.info("문자 인증 검증하기");
		
		//세션에 저장된 인증번호 
		String sessionSms = (String)session.getAttribute("sessionSmSCode");
		
		logger.info("세션 : {}, 입력 : {}",sessionSms,smsCode);
		if(sessionSms.equals(smsCode)) {
			logger.info("코드 일치");
			
			//세션지우기
			session.removeAttribute("sessionSmSCode");
			return true;
		}
		
		logger.info("코드 불일치");
		return false;
	}

	@Override
	public void updateInfo(HttpSession session,Users userInfo) {
		
		logger.info("성별 : {}",userInfo.getUserGender());
		//세션에서 userNo 추출하여 DTO에 담기
		userInfo.setUserNo((int)session.getAttribute("userNo"));
		//업데이트하기
		
		mypageDao.updateUserInfo(userInfo);
		
	}
	
	@Override
	public String getuserId(int userNo) {
		logger.info("getuserId - 회원 아이디 조회");
		return mypageDao.selectUserId(userNo);
	}
	
	@Override
	public boolean getuserPw(Users updatePwInfo, HttpSession session) {
		logger.info("getuserPw");
		//세션에 저장된 유저번호 DTO에 담기 
		logger.info("session {}", session.getAttribute("userNo"));
		updatePwInfo.setUserNo((int)session.getAttribute("userNo"));
		
		if(mypageDao.selectuserPw(updatePwInfo)>0) {
			logger.info("비밀번호 일치");
			return true;
		}
		
		logger.info("비밀번호 불일치");
		return false;
	}
	@Override
	public boolean getchkPw(Users userPw, HttpSession session) {

		//세션에 있는 유저번호 DTO에 담기
		userPw.setUserNo((int)session.getAttribute("userNo"));
	
		if(mypageDao.selectUserPwByUserNoPw(userPw)>0) {
			logger.info("조회할 정보 {}",userPw);
			logger.info("현재 사용중인 비밀번호 ");
			return false;
		}
		
		logger.info("현재 사용중이지 않은 비밀번호 ");
		return true;
	}
	@Override
		public void updateNewPw(Users userNewPw, HttpSession session) {
		
		logger.info("updateNewPw");
		//세션에 있는 유저번호 DTO에 담기
		userNewPw.setUserNo((int)session.getAttribute("userNo"));
		//비밀번호 update
		mypageDao.updateUserNewPw(userNewPw);
		
	}
	
	 @Override
	public void upload(MultipartFile userPhoto,PhotoFile photoFile) {
		 logger.info("upload 시작");
		
		 //빈 파일일 겨우
		 if(userPhoto.getSize()<=0) {
			 return;
		 }
		 
		 //파일이 저장될 경로
		 String storedPath = context.getRealPath("upload");
		 File storedFolder = new File(storedPath);
		 if(!storedFolder.exists()) {//저장할 폴더가 없을 경우 폴더 생성
			 storedFolder.mkdir();
		 }
		 
		 //파일이 저장될 이름
		 String originName = userPhoto.getOriginalFilename();
		 String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		 
		 logger.info("실제 파일 이름 : {}",originName);
		 logger.info("저장된 파일 이름 : {}", storedName);
		 
		 //저장할 파일의 정보 객체
		 File dest = new File(storedFolder, storedName);
		 
		 try {
			 userPhoto.transferTo(dest); //지정한 파일에 업로드한 파일을 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
		 //----------------------------------
		 //첨부파일 정보 DB 기록하기
		   photoFile.setOriginName(originName);
		   photoFile.setStoredName(storedName);
		   
		 //파일 insert 또는 update
		  
		  
		   if(mypageDao.selectIsProfile(photoFile)> 0){
			   logger.info("사진 있음 -update하기");
			
			//파일번호 구하기
			   int fileNo = mypageDao.selectfileNo(photoFile);
			   logger.info("파일 번호 : {}",fileNo);
			   photoFile.setFileNo(fileNo);
			   
			   mypageDao.updateProfile(photoFile);
			  	
		   }else {
			   //파일 insert
			   logger.info("사진 없음 - insert하기");
			   mypageDao.insertProfile(photoFile);
		   }
		   
	}
	 
	 @Override
	public PhotoFile getPhoto(HttpSession session,PhotoFile profile) {
		 
		 logger.info("getPhoto - 프로필 사진 가져오기");
		 
		 //세션에 회원 정보 저장하기
		 profile.setUserNo((int)session.getAttribute("userNo"));
		 
		 //회원 프로필 (storedName)조회하기
		 PhotoFile storedName = mypageDao.selectStoredName(profile);
		 return storedName;
	}
	 @Override
	public void uploadIntro(Users intro) {

		 logger.info("한줄 소개 -작성 하기 ");
		 
		 logger.info("한줄 소개 있음- update하기");
		 
		 logger.info("한줄 소개 : {}",intro);
		 
		 if(intro.getUserIntro().equals("") || intro.getUserIntro() == null) { //한줄 소개 안적었을 때의 처리
			 	logger.info("한줄 소개 없음");
			 return;
		 }
		 
		 mypageDao.updateIntro(intro);
		 
	}
	 
	 @Override
	public Users getIntro(HttpSession session) {
		logger.info("한줄 소개 가져오기");
		 Users user = new Users();
		 user.setUserNo((int)session.getAttribute("userNo"));
		 
		 Users introSelect = mypageDao.selectUserIntro(user);
		 
		 return introSelect;
	}
	 
	 @Override
	public void dropOtuExe(Users dropOut) {
		 logger.info("dropOutExe 실행");
		 mypageDao.deleteByuserNoPw(dropOut);
	}

	 @Override
	public void setBodyInfo(BodyInfo bodyInfo) {
		 logger.info("파라미터 확인 {}",bodyInfo);
		 //오늘 날짜 구하기
		
		 
		 BodyInfo updateTime = mypageDao.selectTime(bodyInfo);  //DB에 정보 입력한 시간 가져오기 
	
		 logger.info("업데이트 시간 : {}",updateTime);
		 
		 if(updateTime == null) { //회원이 오늘 업데이느 한 정보가 있음 
			 logger.info("몸무게 insert 하기");
			 mypageDao.insertWeight(bodyInfo);
			 
			 
		 } else {
			 logger.info("몸무게 update하기");
			 mypageDao.updateWeight(bodyInfo);
			
		
		 }
		 
	}
	 
	 @Override
	public List<BodyInfo> getBodyList(BodyInfo bodyInfo,HttpSession session) {
		 logger.info("body list  시작 " );
		 //유저번호 저장
		 bodyInfo.setUserNo((int)session.getAttribute("userNo"));
		 
		  List<BodyInfo> weightList = mypageDao.selectWeight(bodyInfo);
		  
		 return weightList;
	}
}
