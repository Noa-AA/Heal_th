package saebyeol.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import saebyeol.dao.face.ProductDao;
import saebyeol.dto.Product;
import saebyeol.service.face.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired ProductDao productDao;
	
	@Override
	public List<Product> listProduct() {
		logger.info("service.list");
		return productDao.listProduct();
	}

}
