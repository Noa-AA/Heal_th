package hyanghee.util;

public class BoardPageMaker {
	
	private int curPage;
	private int listCount; //한 페이지에 보여질 게시글의 수
	private int totalPage; //총 페이지 수
	
	private int pageCount; //한 화면에 출력될 페이지네이션의 개수
	private int startPage; //화면에 보이는 시작 페이지네이션 번호
	private int endPage; //화면에 보이는 끝 페이지네이션 번호
	
	private int startNo; //화면에 보이는 게시글의 시작 번호
	private int endNo; //화면에 보이는 게시글의 끝 번호
	
//	private int startPage;
//	private int endPage;
	private boolean prev, next;
	private int total;

	private BoardSearch boardSearch;
	
	public BoardPageMaker() {	}

	
	public BoardPageMaker(BoardSearch boardSearch, int total) {
		setTotal(total);
		setBoardSearch(boardSearch);
		setCurPage(boardSearch.getcurPage());
		
		makePaging();
	}
	
	public BoardPageMaker(int total, int curPage, int listCount, int pageCount) {
		setTotal(total);
		setCurPage(curPage);
		setListCount(listCount);	//화면에 보여질 게시글 개수 지정하기
		setPageCount(pageCount);	//화면에 보여질 페이징 개수 지정하기
		
		makePaging();
	}
	
	//페이지 정보를 생성(계산)하는 메소드
			private void makePaging() {
				if(total == 0)	return; //게시글이 없는 경우 중단
				
				//기본값 설정
				if(curPage == 0)	this.curPage = 1; //첫 페이지를 기본 페이지로 설정한다
				if(listCount == 0)	this.listCount = 10; //화면에 보여질 게시글 수를 10개로 설정
				if(pageCount == 0)	this.pageCount = 10; //화면에 보여질 페이징 수를 10개로 설정
				
				//------------------------------------
				
				//총 페이지 수 계산
				totalPage = total / listCount; // 총 게시글 수 / 한 페이지 게시글 수
				if( total % listCount > 0 )	totalPage++;
				
				//총 페이지 수 보정
				//	-> 존재하는 페이지보다 큰 값의 페이지를 요청할 때
				//	-> 요청 페이지를 마지막 페이지로 변경한다
				if( curPage > totalPage )	curPage = totalPage;
				
				//------------------------------------
				
				//화면에 보이는 페이지네이션의 시작 번호, 끝 번호 계산
				startPage = ( (curPage-1)/pageCount ) * pageCount + 1;
				endPage = startPage + pageCount - 1;
			
				//총 페이지 수 보다 페이지네이션 끝번호가 클 때
				//	-> 마지막 페이지까지만 보이도록 설정한다
				if( endPage > totalPage )	endPage = totalPage;
				
				//------------------------------------
				
				//화면에 보이는 게시글의 시작 번호, 끝 번호 계산
				startNo = ( curPage-1 ) * listCount + 1;
				endNo = curPage * listCount;
				
			}


	public BoardPageMaker(int curPage, int listCount, int totalPage, int pageCount, int startPage, int endPage,
			int startNo, int endNo, boolean prev, boolean next, int total, BoardSearch boardSearch) {
		super();
		this.curPage = curPage;
		this.listCount = listCount;
		this.totalPage = totalPage;
		this.pageCount = pageCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startNo = startNo;
		this.endNo = endNo;
		this.prev = prev;
		this.next = next;
		this.total = total;
		this.boardSearch = boardSearch;
	}


	@Override
	public String toString() {
		return "BoardPageMaker [curPage=" + curPage + ", listCount=" + listCount + ", totalPage=" + totalPage
				+ ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage=" + endPage + ", startNo="
				+ startNo + ", endNo=" + endNo + ", prev=" + prev + ", next=" + next + ", total=" + total
				+ ", boardSearch=" + boardSearch + "]";
	}


	public int getCurPage() {
		return curPage;
	}


	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
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


	public BoardSearch getBoardSearch() {
		return boardSearch;
	}


	public void setBoardSearch(BoardSearch boardSearch) {
		this.boardSearch = boardSearch;
	}
	
	

	
	
	

	

	
//	public BoardPageMaker(BoardSearch boardSearch, int total) {
//
//		this.boardSearch = boardSearch;
//		this.total = total;
//
//		/* 마지막 페이지 */
//		this.endPage = (int) (Math.ceil(boardSearch.getPageNum() / 10.0)) * 10;
//		/* 시작 페이지 */
//		this.startPage = this.endPage - 9;
//
//		/* 전체 마지막 페이지 */
//		int realEnd = (int) (Math.ceil(total * 1.0 / boardSearch.getAmount()));
//
//		/*
//		 * 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정
//		 */
//		if (realEnd < this.endPage) {
//			this.endPage = realEnd;
//		}
//
//		/* 시작 페이지(startPage)값이 1보다 큰 경우 true */
//		this.prev = this.startPage > 1;
//
//		/* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
//		this.next = this.endPage < realEnd;
//
//	}
//
//	public int getStartPage() {
//		return startPage;
//	}
//
//	public void setStartPage(int startPage) {
//		this.startPage = startPage;
//	}
//
//	public int getEndPage() {
//		return endPage;
//	}
//
//	public void setEndPage(int endPage) {
//		this.endPage = endPage;
//	}
//
//	public boolean isPrev() {
//		return prev;
//	}
//
//	public void setPrev(boolean prev) {
//		this.prev = prev;
//	}
//
//	public boolean isNext() {
//		return next;
//	}
//
//	public void setNext(boolean next) {
//		this.next = next;
//	}
//
//	public int getTotal() {
//		return total;
//	}
//
//	public void setTotal(int total) {
//		this.total = total;
//	}
//
//	public BoardSearch getBoardSearch() {
//		return boardSearch;
//	}
//
//	public void setBoardSearch(BoardSearch boardSearch) {
//		this.boardSearch = boardSearch;
//	}

	
	
	
}
