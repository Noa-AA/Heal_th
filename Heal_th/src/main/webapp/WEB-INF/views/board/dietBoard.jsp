<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<jsp:include page="../layout/header.jsp" />


<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

body{
	font-family: 'Noto Sans','NotoSansWeb',Verdana,"맑은 고딕",Malgun Gothic,Dotum,돋움,Gulim,굴림,sans-serif;
	margin: 0;
	padding: 0;
}

#container{
	width: 1200px;
	height: 1800px;
}

#btnWrite {
    background: #7ca3f5;  /* fallback for old browsers */
    color: #fff;
	border: none;
	border-radius: 7px;
	font-size: 22px;
	font-weight: bold;
	width: 173px;
	height: 50px;
}

#noticeStrong {
	background: #ff4057;
    font-weight: bold;
    color: white;
    padding-top: 4px;
    padding-bottom: 4px;
    padding-right: 10px;
    padding-left: 10px;
    border-radius: 16px;
	
}

#totalList {
    color: #7ca3f5;
	text-decoration: none;	
	font-weight: bold;
	width: 120px;
	height: 34px;
	float: right;
    margin-top: 15px;
	
}

#search {
	text-align: center;
	margin-bottom: -5px;
	
}

#type{
	border: 2px solid #7ca3f5;
	font-weight: border;
	display: none;
}

#searchText{
	width: 360px;
	padding: 0 6px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding-top: 8px;
	padding-bottom: 8px;
}

#searchText:hover{
  box-shadow: 0px 0px .5px 1px #7ca3f5;
  width: 380px;
}

#searchIcon{
 margin-left: -39px;
  width: 30px;
  height: 30px;
  background-color: #fff;
  color: #7ca3f5;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  border: none;
}

/* 페이징 부분 */
.text-center {
	display: flex;
	justify-content: center; 
	margin-top: 50px;
}

.pagination {
	display: flex;
	margin: 0;
}

.pagination > li{
	display: flex;
}

.pagination > li > a {
	display: flex;
	margin: 0 4px;
	width: 40px;
	height: 40px;
	border-radius: 20px !important;
	font-size: 16px;
	justify-content: center;
	align-items: center;
	color: #7ca3f5;
}

.none:hover {
	cursor: default;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	background-color: #7ca3f5;
    border-color: #7ca3f5;
}


.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 48
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	let moveForm = $("#moveForm");
	$(".move")
		.on(
			"click",
			function(e) {
				e.preventDefault();
				moveForm.empty();

				moveForm
						.append("<input type='hidden' name='dietNo' value='"
								+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/board/searchView");
				moveForm.submit();
			});
	
	//페이지 이동 번호 동작
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();

		moveForm.find("input[name='curPage']").val($(this).attr("href"));
		moveForm.attr("action", "/board/dietBoard");
		moveForm.submit();

	});



	//검색 버튼
	$(".search_area button").on("click", function(e) {
		e.preventDefault();

		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();

		if (!keyword) {
			alert("키워드를 입력하세요.");
			return false;
		}

		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='curPage']").val(1);
		moveForm.submit();
	});
	
	
	//검색창 엔터시 검색 기능 
	$("#searchText").keydown(function (key) {
		if (key.keyCode == 13) {
			 
            // 엔터키가 눌렸을 때 실행할 내용
			$("#searchIcon").click();
       }
	})
	
	//글쓰기 버튼
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/dWrite")
	})
	
})

</script>



<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">커뮤니티</p>
	</div>
</div>
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/board/boardList">소개</a>
		<a href="/board/bfBoard">비포 애프터</a>
		<a href="/board/verifyBoard">운동 인증</a>
		<a href="/board/dietBoard">식단 공유</a>
		<a href="/board/reviewBoard">시설 후기</a>
	</div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



<div class="container" id="container">

<div class="dietBoard" id="search" name="search">


<div class="search_wrap">
		
			<div class="search_area">
				<select name="type" id="type">
					<option value="T" <c:out value="${pageMaker.boardSearch.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.boardSearch.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="TC" <c:out value="${pageMaker.boardSearch.type eq 'TC'?'selected':'' }"/>>제목+내용</option>
				</select> 
				
					<input id="searchText" type="text" name="keyword" value="${pageMaker.boardSearch.keyword }" placeholder="search...">
				<button id="searchIcon"><i class="fas fa-search"></i></button>
				
				
			</div>
		</div>
	</div>

<br><br><br><br>


<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">

				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a href="${pageMaker.startPage - 1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.boardSearch.curPage == num ? "active":"" }"></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>

			</ul>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" id="dietNo" name="dietNo" value='<c:out value="${pageInfo.dietNo}"/>'>
		<input type="hidden" name="curPage" value="${pageMaker.boardSearch.curPage }">
		<input type="hidden" name="amount" value="${pageMaker.boardSearch.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.boardSearch.keyword }">
		<input type="hidden" name="type" value="${pageMaker.boardSearch.type }">
	</form>
	

<br><br><br><br>


<div id="boardList">
	<h3 style="font-weight: bold; color: #06364E; font-size: 30px;">식단 공유 게시판</h3>
</div>


<div>
    	<a href="/board/dietBoard" id="totalList" name="totalList">전체 게시글 보기 ▼</a>
    </div>


<table class="table table-hover">
<thead>
	<tr style="border-top: 3px solid #84C9E3;">
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 10%;">좋아요</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>

<!-- 공지사항 -->
<c:forEach items="${notice}" var="notice">
	<tr id="warn">
		<td><strong id="noticeStrong">공지</strong> </td>
		<td><a href="/notice/view?noticeNo=${notice.noticeNo}&noticeNo=3&"> <strong>${notice.noticeTtl } </strong></a></td>
		<td><strong style="color: #0D71A4;">관리자</strong></td>
		<td>${notice.noticeHit }</td>
		<td>공지</td>
		<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd" /></td>
	</tr>
		
</c:forEach>

<!-- 일반 게시글 / 검색결과 -->
<c:forEach items="${boardSearch }" var="board">
	<tr id="searchResult">
		<td>${board.dietNo }</td>
		<td><a href="${path}/board/dView?dietNo=${board.dietNo}">${board.dTitle }</a></td>
		<td>${board.userNo }</td>
		<td>${board.dHit }</td>
		<td>${board.dThumbs }</td>
		<td><fmt:formatDate value="${board.dInstDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>

<tr  style="border-bottom: 3px solid #84C9E3;"></tr>

</tbody>
</table>

	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 (이동할게 없을때) --%>
		<c:if test="${pageMaker.curPage eq 1 }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${pageMaker.curPage ne 1 }">
			<li><a href="/board/dietBoard"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${pageMaker.curPage > 1 }">
			<li><a href="/board/dietBoard?curPage=${pageMaker.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때) --%>
		<c:if test="${pageMaker.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="i">
		<c:if test="${pageMaker.curPage eq i }">
			<li class="active"><a href="/board/dietBoard?curPage=${i }">${i }</a></li>
		</c:if>
		
		<c:if test="${pageMaker.curPage ne i }">
			<li><a href="/board/dietBoard?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${pageMaker.curPage < pageMaker.totalPage }">
			<li><a href="/board/dietBoard?curPage=${pageMaker.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${pageMaker.curPage >= pageMaker.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${pageMaker.curPage ne pageMaker.totalPage }">
			<li><a href="/board/dietBoard?curPage=${pageMaker.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		<%-- 끝 페이지로 이동 (끝으로갈게 없을때) --%>
		<c:if test="${pageMaker.curPage eq pageMaker.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		</ul>
	</div>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center" style="text-align: center;">
        	<button type="button" id="btnWrite" class="btn btn-warning btn-icon-text animatebutton"><i class="fa fa-check btn-icon-prepend" style="margin-right: 10px;"></i>글쓰기</button> 
        	
       </div>
    </div>
</div>

</div><!-- .container -->


