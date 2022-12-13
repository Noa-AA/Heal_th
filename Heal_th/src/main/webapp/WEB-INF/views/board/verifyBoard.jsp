<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<button>글쓰기</button>

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
		<td>${board.verify_no }</td>
		<td>${board.category_no }</td>
		<td>${board.v_title }</td>
		<td>${board.user_no }</td>
		<td>${board.v_hit }</td>
		<td><fmt:formatDate value="${board.v_inst_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<%-- <c:import url="/WEB-INF/views/board/paging.jsp" /> --%>

</div><!-- .container -->



</body>
</html>