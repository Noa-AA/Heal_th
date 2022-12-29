package saebyeol.service.face;

import java.util.List;

import saebyeol.dto.AttachImage;
import saebyeol.dto.Criteria;
import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;

public interface ProductService {
	
	//상품등록
	public void productEnroll(Product product);
	
	//카테고리 리스트
	public List<Prodcategory> cateList();
	
	//상품 리스트 
	public List<Product> list(Criteria cri);
   
   //상품 총 개수
   public int getTotal(Criteria cri);

   //상품 상세
   public Product getDetail(int prodNo);

   //상품 수정
   public int modify(Product product);
   
   //상품 삭제
   public int delete(int prodNo);

   //지정 상품 이미지 
   public List<AttachImage> getAttachInfo(int prodNo);

   //상품 정보
   public Product getInfo(int prodNo);

   //상품
   public int productGetTotal(Criteria cri);

   //상품 검색
   public List<Product> getProductList(Criteria cri);




	
	
}
