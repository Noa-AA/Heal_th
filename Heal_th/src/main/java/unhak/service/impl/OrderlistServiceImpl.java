package unhak.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unhak.dao.face.OrderlistDao;
import unhak.dto.CartDto;
import unhak.service.face.OrderlistService;
@Service
public class OrderlistServiceImpl implements OrderlistService{

	@Autowired OrderlistDao orderlistDao;
	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<CartDto> getOrderList(int userNo) {
		
		List<CartDto> cart = orderlistDao.getOrder(userNo);
		
		return cart;
	}

}
