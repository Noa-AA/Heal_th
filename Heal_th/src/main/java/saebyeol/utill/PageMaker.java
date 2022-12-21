package saebyeol.utill;

public class PageMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;

	private Search Search;
	
	public PageMaker(Search Search, int total) {

		this.Search = Search;
		this.total = total;

		/* 마지막 페이지 */
		this.endPage = (int) (Math.ceil(Search.getPageNum() / 10.0)) * 10;
		/* 시작 페이지 */
		this.startPage = this.endPage - 9;

		/* 전체 마지막 페이지 */
		int realEnd = (int) (Math.ceil(total * 1.0 / Search.getAmount()));

		/*
		 * 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정
		 */
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		/* 시작 페이지(startPage)값이 1보다 큰 경우 true */
		this.prev = this.startPage > 1;

		/* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
		this.next = this.endPage < realEnd;

	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Search getSearch() {
		return Search;
	}

	public void setSearch(Search Search) {
		this.Search = Search;
	}

}
