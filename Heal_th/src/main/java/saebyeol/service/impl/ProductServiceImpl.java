package saebyeol.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import saebyeol.dao.face.ProductDao;
import saebyeol.dto.AttachImage;
import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;
import saebyeol.service.face.ProductService;
import saebyeol.utill.SaebyeolPaging;

@Service
public class ProductServiceImpl implements ProductService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired ProductDao productDao;
	
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
	public List<Product> list(SaebyeolPaging paging) {
		logger.info("Service List");
		return productDao.selectList(paging);
	}
	
	@Override
	public SaebyeolPaging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = productDao.selectCntAll();
		
		//페이징 계산
		SaebyeolPaging paging = new SaebyeolPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public Product view(Product viewProduct) {
		return productDao.selectProduct(viewProduct);
	}

	@Override
	public void update(Product product) {
		if("".equals(product.getpName())) {
			product.setpName("제목없음");
		}
		
		productDao.updateProduct(product);
	}
	
	@Override
	public void delete(Product product) {
		productDao.delete(product);
	}
}
