package daeyeon.util;

import java.util.Arrays;

public class UserSearch {

	private int pageNum;
    private int amount;
    private String keyword;
    private String type;
    private String[] typeArr;
    
    public UserSearch() {
		this(1,10);
	}

	public UserSearch(int pageNum, int amount) {
		this.pageNum = pageNum;
        this.amount = amount;
	}

	public UserSearch(int pageNum, int amount, String keyword, String type, String[] typeArr) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
		this.type = type;
		this.typeArr = typeArr;
	}

	@Override
	public String toString() {
		return "UserSearch [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
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
	
}
