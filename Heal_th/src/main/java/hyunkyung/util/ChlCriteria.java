package hyunkyung.util;

import java.util.Arrays;

public class ChlCriteria {
	
	/* 현재 페이지 */
    private int pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;
    
    /* 검색 키워드 */
    private String keyword;
    
    /* 검색 타입 */
    private String type;
    
    /*검색 타입 배열 변환 */
    private String[] typeArr;
    
    /* 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 6 */
    public ChlCriteria() {
        this(1,6);
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public ChlCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		
		//공백 ""을 사용하여 문자열 분리
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	@Override
	public String toString() {
		return "ChlCriteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}


	
	
	
	

	
	
    

}
