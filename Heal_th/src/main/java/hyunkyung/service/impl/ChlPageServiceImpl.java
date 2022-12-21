package hyunkyung.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hyunkyung.dao.face.ChlPageDao;
import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeFile;
import hyunkyung.dto.ParticipantList;
import hyunkyung.service.face.ChlPageService;
import yerim.dto.Users;

@Service
public class ChlPageServiceImpl implements ChlPageService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ChlPageDao chlPageDao;

	//유저 정보 조회
	@Override
	public Users getUserInfo(int userno) {
		return chlPageDao.selectUserInfo(userno);
	}

	//회원번호로 내가 가입한 챌린지 조회
	@Override
	public List<Challenge> getList(int userno) {

		List<Challenge> list = chlPageDao.selectjoinList(userno);
		
		for(Challenge c : list) logger.info("내가 가입한 챌린지{}", c);
		
		return list;
	}


	//사진인증 페이지로 이동
	@Override
	public Challenge getPage(int challengeNo) {
		return chlPageDao.getPage(challengeNo);
	}

	
	//회원번호로 인증한 사진 확인하기..?
	@Override
	public List<ChallengeFile> getPhoto(int challengeNo) {
		return chlPageDao.getPhoto(challengeNo);
	}
//
//	@Override
//	public void filesave(MultipartFile file) {
//		
//		//파일의 크기가 0일때 파일 업로드 중단
//		if(file.getSize() <=0) {
//			logger.info("파일의 크기가 0, 처리 중단!");
//			
//			return;
//		}
//		
//		//파일이 저장된 경로 (RealPath)
//		String storedPath = chlPageDao.getRealPath("upload");
//		logger.info("{}", storedPath);
//		
//		//upload폴더가 존재하지 않으면 생성한다
//		File storedFolder = new File(storedPath);
//		storedFolder.mkdir();
//		
//		
//		//저장될 파일 이름 생성하기
//		String storedName = file.getOriginalFilename(); //원본파일명
//		storedName += UUID.randomUUID().toString().split("-")[0]; //UUID추가
//		logger.info("storedName{}", storedName);
//		
//		
//		//실제 저장될 파일 객체
//		File dest = new File(storedFolder, storedName);
//		
//		
//		try {
//			
//			//업로드된 파일을 upload폴더에 저장하기
//			file.transferTo(dest);
//			
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		//-----------------------------------------
//		
//		//DB에 기록할 정보 객체 - DTO
		ChallengeFile filetest = new ChallengeFile();
//		
//		filetest.setOriginfile(file.getOriginalFilename());
//		filetest.setStoredfile(storedName);
//		
//		chlPageDao.insertFile(filetest);
//	}
	
	

	
	
	
	
	
	
	
	




}
