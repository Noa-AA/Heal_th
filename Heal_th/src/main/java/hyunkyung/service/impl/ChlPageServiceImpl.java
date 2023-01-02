package hyunkyung.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import hyunkyung.dao.face.ChlPageDao;
import hyunkyung.dto.Challenge;
import hyunkyung.dto.ChallengeContent;
import hyunkyung.service.face.ChlPageService;
import yerim.dto.Users;

@Service
public class ChlPageServiceImpl implements ChlPageService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ChlPageDao chlPageDao;

	@Autowired
	ServletContext context;

	// 유저 정보 조회
	@Override
	public Users getUserInfo(int userno) {
		return chlPageDao.selectUserInfo(userno);
	}

	// 회원번호로 내가 가입한 챌린지 조회
	@Override
	public List<Challenge> getList(int userno) {

		List<Challenge> list = chlPageDao.selectjoinList(userno);

		for (Challenge c : list)
			logger.info("내가 가입한 챌린지{}", c);

		return list;
	}

	// 사진인증 페이지로 이동
	@Override
	public Challenge getPage(int challengeNo) {
		return chlPageDao.getPage(challengeNo);
	}

	// 챌린지 방번호 별로 사진 리스트 보기
	@Override
	public List<ChallengeContent> getPhoto(int challengeNo) {
		return chlPageDao.getPhoto(challengeNo);
	}

	// 인증 사진 업로드
	@Override
	public void upload(MultipartFile[] chlPhoto, Map<String, Object> data) {
		logger.info("인증사진 upload 시작");

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String path = request.getSession().getServletContext().getRealPath("resources/uploadImage");

		// 파일이 저장될 경로
		File storedFolder = new File(path);
		if (!storedFolder.exists()) {// 저장할 폴더가 없을 경우 폴더 생성
			storedFolder.mkdir();
		}

		List<ChallengeContent> chlList = new ArrayList<ChallengeContent>();

		for (MultipartFile file : chlPhoto) {
			ChallengeContent chlContent = new ChallengeContent();

			// 빈 파일일 겨우
			if (file.getSize() <= 0) {
				return;
			}

			// 파일이 저장될 이름
			String originName = file.getOriginalFilename().replaceAll("\\..*", "");
			String extend = file.getOriginalFilename().replaceAll(".*\\.", "");
			String storedName = originName + UUID.randomUUID().toString().split("-")[4] + "." + extend;

			logger.info("실제 파일 이름 : {}", originName);
			logger.info("저장된 파일 이름 : {}", storedName);

			// 저장할 파일의 정보 객체
			File dest = new File(storedFolder, storedName);

			try {
				file.transferTo(dest); // 지정한 파일에 업로드한 파일을 저장
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			// ----------------------------------
			// 첨부파일 정보 DB 기록하기
			chlContent.setCfilesize((int) file.getSize());
			chlContent.setOriginfile(originName);
			chlContent.setStoredfile(storedName);

			chlList.add(chlContent);

		}
		data.put("list", chlList);
		System.out.println(data);
		System.out.println(chlPageDao.selectFile(data));

		// 파일 insert 또는 update

		if (chlPageDao.selectFile(data) > 0) {
			logger.info("사진 있음 -update하기");

			chlPageDao.updateFile(data);
		}

		// 파일 insert
		logger.info("사진 없음 - insert하기");
		chlPageDao.insertFile(data);

	}

}
