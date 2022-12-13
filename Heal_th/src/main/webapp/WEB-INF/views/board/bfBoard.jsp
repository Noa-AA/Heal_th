<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

#btnWrite {
    background: #7474BF;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #7ca3f5, #c583d6);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #7ca3f5, #c583d6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    color: #fff;
	border: none;
	font-weight: bold;
	width: 60px;
	height: 34px;
	float: right;
	margin-top: -28px;
}



</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/bfWrite")
	})
	
})

</script>







<div class="container">

<h1>게시판 리스트</h1><br><br>

<div class="search">
<form action="">
	<input type="hidden" name="boardCode" value="${param.boardCode }">
	<input type="hidden" name="page" value="1"> 
	<select name="searchType">
		<option <c:if test="${param.searchType == 'title'}"> selected </c:if> value="title">제목</option>
		<option <c:if test="${param.searchType == 'body'}"> selected </c:if> value="body">내용</option>
		<option <c:if test="${param.searchType == 'titleAndBody'}"> selected </c:if> value="titleAndBody">제목+내용</option>
		
	</select>
	
	<script type="text/javascript">
	
	if( typeof param.searchType =='undefined' ) {
		param.searchType = 'title';
	}
	
	$('form[name="searchForm"] select[]name=searchType').val(parma.searchType);
	
	</script>
	
	<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요">
	<input type="submit" value="검색">
	
</form>
</div>

<br><br>

<hr>

<br><br>

<h3>비포 애프터 게시판</h3>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center"> 
        	<button type="button" id="btnWrite" class="btn btn-warning btn-icon-text animatebutton"> <i class="fa fa-check btn-icon-prepend"></i>글쓰기</button> 
       </div>
    </div>
</div>


<!-- <button id="btnInsert">글쓰기</button> -->


<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 10%;">좋아요</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.bfNo }</td>
		<td><a href="${path}/board/bfView?bfNo=${board.bfNo}">${board.bfTitle }</a></td>
		<td>${board.userNo }</td>
		<td>${board.bfHit }</td>
		<td>${board.bfThumbs }</td>
		<td><fmt:formatDate value="${board.bfInstDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/board/paging.jsp" />

</div><!-- .container -->


