package hyanghee.util;

import java.util.Arrays;

public class BoardSearch {

    private int curPage; //현재 페이지
    private int amount; //한 페이지 당 보여질 개시글 갯수
    private String keyword;
    private String type;
    private String[] typeArr;
    
    
    
    public BoardSearch() {
		this(1,10);
	}

	public BoardSearch(int curPage, int amount) {
		this.curPage = curPage;
        this.amount = amount;
	}

	public BoardSearch(int curPage, int amount, String keyword, String type, String[] typeArr) {
		super();
		this.curPage = curPage;
		this.amount = amount;
		this.keyword = keyword;
		this.type = type;
		this.typeArr = typeArr;
	}

	@Override
	public String toString() {
		return "BoardSearch [curPage=" + curPage + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}

	public int getcurPage() {
		return curPage;
	}

	public void setcurPage(int curPage) {
		this.curPage = curPage;
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
