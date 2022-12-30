package saebyeol.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import saebyeol.dao.face.AttachDao;
import saebyeol.dao.face.ProductDao;
import saebyeol.dto.AttachImage;
import saebyeol.dto.ProductCriteria;
import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;
import saebyeol.service.face.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired ProductDao productDao;
	
	@Autowired AttachDao attachDao;
	
	@Transactional
	@Override
	public void productEnroll(Product product) {
		logger.info("Service 상품 등록");
		productDao.productEnroll(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		
		for(AttachImage attach : product.getImageList()) {
			attach.setProdNo(product.getProdNo());
			productDao.imageEnroll(attach);
		}
	}

	@Override
	public List<Prodcategory> cateList() {
		logger.info("Service 카테고리 리스트");
		return productDao.cateList();
	}
	
	
	@Override
	public int getTotal(ProductCriteria cri) {
		logger.info("getTotal===");
		
		return productDao.getTotal(cri);
	}
	
	@Override
	public Product getDetail(int prodNo) {
		
		logger.info("productGetDetail--- " + prodNo);
		return productDao.getDetail(prodNo);
	}
	


	@Transactional
	@Override
	public int modify(Product product) {
		
		int result = productDao.modify(product);
		
		if(result == 1 && product.getImageList() != null && product.getImageList().size() > 0) {
			productDao.deleteImageAll(product.getProdNo());
			
			product.getImageList().forEach(attach -> {
				attach.setProdNo(product.getProdNo());
				productDao.imageEnroll(attach);
			});
			
		}
		
		return result;
		
		
	}
	
	@Transactional
	@Override
	public int delete(int prodNo) {
		productDao.deleteImageAll(prodNo);
		return productDao.delete(prodNo);
	}
	
	@Override
	public List<AttachImage> getAttachInfo(int prodNo) {
		return productDao.getAttachInfo(prodNo);
	}
	
	@Override
	public Product getInfo(int prodNo) {
		Product info = productDao.getInfo(prodNo);
		info.setImageList(productDao.getAttachInfo(prodNo));
		return info;
	}

	@Override
	public List<Product> getProductList(ProductCriteria cri) {
		List<Product> list = productDao.getProductList(cri);
		
		list.forEach(product -> {
			
			int prodNo = product.getProdNo();
			
			List<AttachImage> imageList = attachDao.getAttachList(prodNo);
			
			product.setImageList(imageList);
			
		});
		
		return list;
	}
	

	
}
