package changmin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import changmin.dao.face.DgMoneyDao;
import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import changmin.service.face.DgMoneyService;
import changmin.util.AdminWithDrawPaging;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

@Service
public class DgMoneyServiceImpl implements DgMoneyService{

	private Logger logger = LoggerFactory.getLogger(DgMoneyServiceImpl.class);

	@Autowired DgMoneyDao dgMoneyDao;
	
	@Override
	public int getMmoney(int userno) {

		return dgMoneyDao.selectDgmoney(userno);
	}

	@Override
	public void addMmoney(MmoneyPay mmoneyPay) {
		
		dgMoneyDao.insertDgmoney(mmoneyPay);
	}

	@Override
	public Users getUserInfo(int userno) {

		return dgMoneyDao.selectUserInfo(userno);
	}

	@Override
	public void chargeMmoney(MmoneyPay mmoneyPay) {

		dgMoneyDao.updateDgmoney(mmoneyPay);
	}


	@Override
	public void addWithDraw(WithDraw withDraw) {

		dgMoneyDao.insertWithDraw(withDraw);
	}

	@Override
	@Transactional
	public void changeMmoney(WithDraw wd) {
		
		dgMoneyDao.updateDgmoneybyAdmin(wd);
		dgMoneyDao.updateWdProcess(wd);
	}

	@Override
	public int cntWithDraw(int userno) {
		
		int count = dgMoneyDao.selectWithDrawCnt(userno);
		
		return count;
	}

	@Override
	public AdminWithDrawPaging getWdPaging(String curPage) {
		//총 게시글 수 조회하기
		int totalCount = dgMoneyDao.selectCntAll();
		
		
		//전달파라미터 curPage 추출하기
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}
		
		//DgHelperPaging객체 생성
		AdminWithDrawPaging wdPaging = new AdminWithDrawPaging(totalCount, curPage2);
		return wdPaging;
	}

	@Override
	public List<WithDraw> getWithDrawList(AdminWithDrawPaging wdPaging) {

		return dgMoneyDao.selectWithDrawList(wdPaging);
	}

}
