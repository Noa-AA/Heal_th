<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

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
</style>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnInsert").click(function() {
		$(location).attr("href", "board/bf_write")
	})
	
})

</script>


</head>
<body>




<div class="container">

<h1>게시판 리스트</h1><br><br>

<h3>비포 애프터 게시판</h3>

<button id="btnInsert"><a href="./bf_write">글쓰기</a></button>


<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 10%;">카테고리</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.bf_no }</td>
		<td>${board.category_no }</td>
		<td>${board.bf_title }</td>
		<td>${board.user_no }</td>
		<td>${board.bf_hit }</td>
		<td><fmt:formatDate value="${board.v_inst_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
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