<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${boardPaging.curPage ne 1 }">
		<li><a href="/board/bfBoard">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${boardPaging.startPage ne 1 }">
		<li><a href="/board/bfBoard?curPage=${boardPaging.startPage - boardPaging.pageCount }">&laquo;</a></li>
	</c:when>
	<c:when test="${boardPaging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${boardPaging.curPage > 1 }">
		<li><a href="/board/bfBoard?curPage=${boardPaging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${boardPaging.startPage }" end="${boardPaging.endPage }" var="i">
	<c:if test="${boardPaging.curPage eq i }">
		<li class="active"><a href="/board/bfBoard?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${boardPaging.curPage ne i }">
		<li><a href="/board/bfBoard?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${boardPaging.curPage < boardPaging.totalPage }">
		<li><a href="/board/list?curPage=${boardPaging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${boardPaging.endPage ne boardPaging.totalPage }">
		<li><a href="/board/list?curPage=${boardPaging.startPage + boardPaging.pageCount }">&raquo;</a></li>
	</c:when>
	<c:when test="${boardPaging.endPage eq boardPaging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${boardPaging.curPage ne boardPaging.totalPage }">
		<li><a href="/board/list?curPage=${boardPaging.totalPage }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>


</body>
</html>