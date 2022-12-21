package saebyeol.service.face;

import java.util.List;

import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;
import saebyeol.utill.SaebyeolPaging;

public interface ProductService {
	/**
	 * 상품 등록
	 * @param product
	 */
	public void productEnroll(Product product);
	
	/**
	 * 카테고리 리스트
	 * @return
	 */
	public List<Prodcategory> cateList();
	
	/**
    * 상품 리스트 
    * @param paging
    * @return
    */
   public List<Product> list(SaebyeolPaging paging);
   
   /**
    * 상품 총 개수
    * @param paging
    * @return
    */
   public SaebyeolPaging getPaging(int curPage);

   /**
    * 상품 상세 보기
    * @param viewProduct
    * @return
    */
   public Product view(Product viewProduct);

   /**
    * 상품 수정
    * @param product
    */
   public void update(Product product);

   /**
    * 상품 삭제
    * @param product
    */
   public void delete(Product product);
	
	
}
