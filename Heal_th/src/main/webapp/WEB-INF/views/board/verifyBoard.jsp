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
		$(location).attr("href", "/board/vWrite")
	})
	
})

</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="container">

<h1>게시판 리스트</h1><br><br>

<h3>운동 인증 게시판</h3>

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
		<td>${board.verifyNo }</td>
		<td><a href="${path}/board/verifyView?verifyNo=${board.verifyNo}">${board.vTitle }</a></td>
		<td>${board.userNo }</td>
		<td>${board.vHit }</td>
		<td>${board.vThumbs }</td>
		<td><fmt:formatDate value="${board.vInstDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/board/paging.jsp" />

</div><!-- .container -->





</body>
</html>