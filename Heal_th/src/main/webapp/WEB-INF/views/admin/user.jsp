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
}

.contentTr {
	display: flex;
	height: 50px;
	border-bottom: 1px solid #e3e3e3;
	align-items: center;
	color: #666;
}


/* 회원 번호 */
.contentTr > td:nth-child(1), #titleTr > th:nth-child(1) {
	width: 7%;
	display: flex;
	justify-content: center;
}

/* 아이디 */
.contentTr > td:nth-child(2), #titleTr > th:nth-child(2) {
	width: 10%;
	display: flex;
	justify-content: center;
}

/* 닉네임 */
.contentTr > td:nth-child(3), #titleTr > th:nth-child(3) {
	width: 10%;
	display: flex;
	justify-content: center;
}

/* 이름 */
.contentTr > td:nth-child(4), #titleTr > th:nth-child(4) {
	width: 8%;
	display: flex;
	justify-content: center;
}

/* 성별 */
.contentTr > td:nth-child(5), #titleTr > th:nth-child(5) {
	width: 6%;
	display: flex;
	justify-content: center;
}

/* 가입일 */
.contentTr > td:nth-child(6), #titleTr > th:nth-child(6) {
	width: 14%;
	display: flex;
	justify-content: center;
}

/* 이메일 */
.contentTr > td:nth-child(7), #titleTr > th:nth-child(7) {
	width: 18%;
	display: flex;
	justify-content: center;
}

/* 회원등급 */
.contentTr > td:nth-child(8), #titleTr > th:nth-child(8) {
	width: 6%;
	display: flex;
	justify-content: center;
}

/* 득근머니 */
.contentTr > td:nth-child(9), #titleTr > th:nth-child(9) {
	width: 10%;
	display: flex;
	justify-content: center;
}

/* 포인트 */
.contentTr > td:nth-child(10), #titleTr > th:nth-child(10) {
	width: 10%;
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

#titleDiv{
	display: flex;
	justify-content: space-between;
    align-items: flex-end;
}


select::-ms-expand { display:none; } 


</style>

</head>
<body>

<div id="titleDiv">
	<h3>회원 목록</h3>
	<a href="/admin/user">전체보기</a>
</div>

	<table id="table">
		<tr id="titleTr">
			<th>회원 번호</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>성별</th>
			<th>가입일</th>
			<th>이메일</th>
			<th>회원등급</th>
			<th>득근머니</th>
			<th>포인트</th>
		</tr>
		
		<c:forEach items="${userList }" var="u" varStatus="status">
		<tr class="contentTr"> 
			<td>${u.userNo }</td>
			<td>${u.userId }</td>
			<td>${u.userNick }</td>
			<td>${u.userName }</td>
			<td>
				<c:if test="${u.userGender eq 'male'}">남자</c:if>
				<c:if test="${u.userGender eq 'female'}">여자</c:if>
			</td>
			<td><fmt:formatDate value="${u.userJoinDate }" pattern="yyyy년MM월dd일" /></td>
			<td>${u.userEmail }</td>
			<td>${u.rankingNo }</td>
			<td>${u.dgMoney }득근</td>
			<td>${u.point }포인트</td>
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
			<li><a href="/admin/user"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><a href="/admin/user?curPage=${paging.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때)--%>
		<c:if test="${paging.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/admin/user?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/admin/user?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><a href="/admin/user?curPage=${paging.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${paging.curPage >= paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/admin/user?curPage=${paging.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		<%-- 끝 페이지로 이동 (끝으로갈게 없을때) --%>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		</ul>
	</div>
	
	
	<!-- 검색 기능 -->
	<div class="searchBack">
		<form action="/admin/user" method=post name="search" id="searchForm">

			<select name="type" id="type">
				<option value="userNick" <c:out value="${paging.type eq 'userNick'?'selected':'' }"/> >닉네임</option>
				<option value="userName" <c:out value="${paging.type eq 'userName'?'selected':'' }"/> >이름</option>
			</select>
			
			<input id="searchText" type="text" name="keyword" value="${paging.keyword }" placeholder="search...">
			<button type="submit" id="searchIcon" ><i class="fas fa-search"></i></button>

		</form>
	</div>
	
	

</body>
</html>














