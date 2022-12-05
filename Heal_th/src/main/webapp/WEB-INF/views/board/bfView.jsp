<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/board/bfBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/bfUpdate?bfNo=${viewBoard.bfNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/bfDelete?bfNo=${viewBoard.bfNo }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td colspan="3">${viewBoard.bfNo }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>${viewBoard.writerId }</td>
	<td class="info">닉네임</td><td>${viewBoard.writerNick }</td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.hit }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewBoard.title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewBoard.content }</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${id eq viewBoard.writerId }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

</div><!-- .container end -->

















