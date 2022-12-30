package jucheol.util;

public class Infinity {
	private int startNo;
	private int endNo;
	private int userNo;
	
	private int listCount;
	
	public Infinity() {	}

	public Infinity(int endNo) {
		setEndNo(endNo);
		makeList();
	}

	private void makeList() {
		if(endNo == 0 ) this.endNo = 1;
		
		listCount = 6;
		startNo = endNo;
		endNo += listCount-1;
		
		
	}

	public Infinity(int startNo, int endNo, int userNo, int listCount) {
		super();
		this.startNo = startNo;
		this.endNo = endNo;
		this.userNo = userNo;
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "Infinity [startNo=" + startNo + ", endNo=" + endNo + ", userNo=" + userNo + ", listCount=" + listCount
				+ "]";
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	
	
}
