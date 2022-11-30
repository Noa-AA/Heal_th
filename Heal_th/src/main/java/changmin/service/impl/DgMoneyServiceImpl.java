package changmin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.dao.face.DgMoneyDao;
import changmin.dto.MmoneyPay;
import changmin.dto.WithDraw;
import changmin.service.face.DgMoneyService;
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
	public List<WithDraw> getWithDrawList() {

		return dgMoneyDao.selectWithDrawList();
	}

}
