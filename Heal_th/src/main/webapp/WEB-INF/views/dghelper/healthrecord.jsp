<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bigContainger {
	width: 1440px;
	margin: 0 auto;
}
#id {
	float:right;
}

ul {
	list-style:none;
}

</style> 
</head>
<body>
<div class="bigContainer">
<h1>운동 기록장</h1>
<span id="healthcount">2022년 운동 횟수 : x회</span>
<table>
	<c:forEach items="${list }" var="i">
	<tr>
		<td>기록번호 : ${i.recordNo }</td>
		<td>내용 : ${i.recordCon }</td>
		<td>날짜 : ${i.recordDate }</td>
	</tr>
	</c:forEach>
</table>
	<form action="./healthrecord" method="post">
		<textarea rows="" cols="" name="recordcon"></textarea>
		<button>저장</button>
	</form>
</div>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/dghelper/healthrecord">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/dghelper/healthrecord?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/dghelper/healthrecord?curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/dghelper/healthrecord?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/dghelper/healthrecord?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/dghelper/healthrecord?curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/dghelper/healthrecord?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/dghelper/healthrecord?curPage=${paging.totalPage }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>

</body>
</html>