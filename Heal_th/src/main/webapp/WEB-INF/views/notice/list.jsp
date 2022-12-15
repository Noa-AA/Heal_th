<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="../layout/adminheader.jsp" />
<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "./write")
	})

})
</script>
<style type="text/css">
h1{text-align: center;}

</style>

<div class="container">

<h1>공지사항</h1>
<button type="button" class="btn btn btn-default" id="btnAll">전체글 관리</button> <button type="button" class="btn btn-default" id="btnNotice">공지사항</button>
<hr>

<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 50%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 15%;">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.noticeNo }</td>
		<td><a href="/notice/view?noticeNo=${notice.noticeNo }" style="color: black;">${notice.noticeTtl }</td>
		<td>${notice.userNo }</td>
<%-- 		<fmt:formatDate value="${notice.noticeDate }" var="dateValue" pattern="yyyy.MM.dd HH:mm:ss"/> --%>
		<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd" /></td>
		<td>${notice.noticeHit }</td>
	</tr>
</c:forEach>


</tbody>

</table>

<button id="btnWrite">글쓰기</button>

</div>

<%-- <%@include file="../layout/footer.jsp" %> --%>

</body>
</html>
