package unhak.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unhak.dao.face.PaymentDao;
import unhak.service.face.PaymentService;
import yerim.dto.Users;

@Service
public class PaymentServiceImpl implements PaymentService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	@Autowired
	PaymentDao paymentDao;
	
	public Users getUserInfo(int userno) {
		return paymentDao.selectUserInfo(userno);
	}
}
