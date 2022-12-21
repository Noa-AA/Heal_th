<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="style.css">

<style type="text/css">


/* 페이징 부분 */

.text-center {
	display: flex;
	justify-content: center; 
	margin-top: 40px;
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


/* 테이블~~~ --------------------------------------------------------- */

#table {
	margin-top: 16px;
}

#titleTr {
	display: flex;
	height: 56px;
	border-top: 1px solid #333;
	border-bottom: 1px solid #e3e3e3;
	background-color: #f2f7fc;
	align-items: center;
	font-size: 15px;
	margin-bottom: 10px;
}

.contentTr {
	display: flex;
	border-bottom: 1px solid #e3e3e3;
	align-items: center;
	color: #666;
	margin-bottom: 10px;
	padding-bottom: 10px;
}


/* 번호 */
.contentTr > td:nth-child(1), #titleTr > th:nth-child(1) {
	width: 5%;
	display: flex;
	justify-content: center;
}

/* 상품 사진 */
.contentTr > td:nth-child(2), #titleTr > th:nth-child(2) {
	width: 8%;
	display: flex;
	justify-content: center;
}

/* 상품사진 컨텐츠 */
.contentTr > td:nth-child(2) >img {
	width: 90px;
	height: 90px;
	background-color: #eee;
}

/* 주문번호 */
.contentTr > td:nth-child(3), #titleTr > th:nth-child(3) {
	width: 9%;
	display: flex;
	justify-content: center;
}

/* 회원번호 */
.contentTr > td:nth-child(4), #titleTr > th:nth-child(4) {
	width: 5%;
	display: flex;
	justify-content: center;
}

/* 상품명 */
.contentTr > td:nth-child(5), #titleTr > th:nth-child(5) {
	width: 14%;
	display: flex;
	justify-content: center;
}

/* 결제수단 */
.contentTr > td:nth-child(6), #titleTr > th:nth-child(6) {
	width: 8%;
	display: flex;
	justify-content: center;
}

/* 결제금액 */
.contentTr > td:nth-child(7), #titleTr > th:nth-child(7) {
	width: 7%;
	display: flex;
	justify-content: center;
}

/* 결제일자 */
.contentTr > td:nth-child(8), #titleTr > th:nth-child(8) {
	width: 10%;
	display: flex;
	justify-content: center;
}

/* 배송지 */
.contentTr > td:nth-child(9), #titleTr > th:nth-child(9) {
	width: 24%;
	display: flex;
	justify-content: center;
}

/* 득근머니 */
.contentTr > td:nth-child(10), #titleTr > th:nth-child(10) {
	width: 8%;
	display: flex;
	justify-content: center;
}




/* 검색부분 --------------------------------------------------------- */

#searchForm {
	display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 30px;
}

#searchText{
	width: 360px;
	height: 40px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding: 8px 12px;
	outline: none;
	font-size: 14px;
}

#searchText:hover{
  box-shadow: 0px 0px .5px 1px #7ca3f5;
  width: 380px;
}

#searchIcon{
  margin-left: -40px;
  width: 30px;
  height: 30px;
  background-color: #fff;
  color: #7ca3f5;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  border: none;
}

#type{
	width: 100px;
	height: 40px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding: 8px 12px;
	outline: none;
	margin-right: 4px;
	-webkit-appearance: none;
    -moz-appearance: none;
    background: url(/resources/img/admin/expand_more.png) no-repeat 86% 50%;
    font-size: 13px;
    font-weight: 500;
    color: #666;
}

select::-ms-expand { display:none; } 


</style>

</head>
<body>

<h3>주문 목록</h3>


	<table id="table">
		<tr id="titleTr">
			<th>번호</th>
			<th>상품사진</th>
			<th>주문번호</th>
			<th>회원 번호</th>
			<th>상품명</th>
			<th>결제수단</th>
			<th>결제금액</th>
			<th>결제일자</th>
			<th>배송지</th>
			<th>휴대폰 번호</th>
		</tr>
		
		<c:forEach items="${paymentList }" var="p">
		<tr class="contentTr">
			<td>${p.rnum }</td>
			<td><img /></td>
			<td>${p.orderNo }</td>
			<td>${p.userNo }</td>
			<td>${p.pName }</td>
			<td>${p.paymentMethod }</td>
			<td>${p.paymentAmount }원</td>
			<td><fmt:formatDate value="${p.paymentDate }" pattern="yyyy년 MM월dd일" /></td>
			<td>${p.address }</td>
			<td>${p.phoneNo }</td>
		</tr>
		</c:forEach>
	</table>
	
	
	<!-- 페이징 부분 -->
	<div class="text-center">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 (이동할게 없을때) --%>
		<c:if test="${paging.curPage eq 1 }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/admin/payment"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/admin/payment?curPage=${paging.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때)--%>
		<c:if test="${paging.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/admin/payment?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/admin/payment?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/admin/payment?curPage=${paging.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${paging.curPage >= paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/admin/payment?curPage=${paging.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		<%-- 끝 페이지로 이동 (끝으로갈게 없을때) --%>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		</ul>
	</div>
	
	
	<!-- 검색 기능 -->
	<div class="searchBack">
		<form action="/admin/payment" method=post name="search" id="searchForm">

			<select name="type" id="type">
				<option value="orderNo" <c:out value="${paging.type eq 'orderNo'?'selected':'' }"/> >주문번호</option>
				<option value="pName" <c:out value="${paging.type eq 'pName'?'selected':'' }"/> >상품명</option>
			</select>
			
			<input id="searchText" type="text" name="keyword" value="${paging.keyword }" placeholder="search...">
			<button type="submit" id="searchIcon" ><i class="fas fa-search"></i></button>

		</form>
	</div>
	
	

</body>
</html>














