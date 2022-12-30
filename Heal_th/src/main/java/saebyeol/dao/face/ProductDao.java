package saebyeol.dao.face;

import java.util.List;

import saebyeol.dto.AttachImage;
import saebyeol.dto.Criteria;
import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;

public interface ProductDao {

	//상품 등록
	public void productEnroll(Product product);
	
	//카테고리
	public List<Prodcategory> cateList();
	
	//상품 목록
	public List<Product> getList(Criteria cri);
	
	//총 상품 수
	public int getTotal(Criteria cri);

	//상품보기
	public Product getDetail(int prodNo);
	
	//상품수정
	public int modify(Product product);

	//상품삭제
	public int delete(int prodNo);
	   
	//이미지 등록
	public void imageEnroll(AttachImage attach);
	
	//지정 상품 이미지 전체 삭제
	public void deleteImageAll(int prodNo);
	
	//지정 상품 이미지 정보 얻기
	public List<AttachImage> getAttachInfo(int prodNo);
	
	//상품 검색
	public List<Product> getProductList(Criteria cri);

	//상품 정보
	public Product getInfo(int prodNo);

	//이미지 데이터 반환
	public List<AttachImage> getAttachList(int prodNo);

	
	

	
	
	
}
