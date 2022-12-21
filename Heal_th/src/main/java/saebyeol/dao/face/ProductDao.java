package saebyeol.dao.face;

import java.util.List;

import saebyeol.dto.AttachImage;
import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;
import saebyeol.utill.SaebyeolPaging;

public interface ProductDao {

	//상품 등록
	public void productEnroll(Product product);
	
	//카테고리
	public List<Prodcategory> cateList();
	
	//상품 목록
	public List<Product> selectList(SaebyeolPaging paging);
	
	//총 상품 수
	public int selectCntAll();

	//상품보기
	public Product selectProduct(Product viewProduct);
	
	//상품수정
	public void updateProduct(Product product);

	//상품삭제
	public void delete(Product product);
	   
	//이미지 등록
	public void imageEnroll(AttachImage attach);
	
	//상품 검색
	public List<Product> getProductList(SaebyeolPaging paging);
	
	//총 갯수
	public int ProductTotal(SaebyeolPaging paging);
	
	
}
