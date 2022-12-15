<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>

<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
	$("#btnList").click(function() {
		$(location).attr("href", "./list")
	})
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "./write")
	})

	$("#btnUpdate").click(function() {
		$(location).attr("href", "/notice/update?noticeNo=${viewNotice.noticeNo}")
	})

	$("#btnDelete").click(function() {
		$(location).attr("href", "/notice/delete?noticeNo=${viewNotice.noticeNo}")
	})

})
</script>

<style type="text/css">
table{margin: auto;}

</style>

<body>

<div class="container">
<button type="button" class="btn btn btn-default" id="btnAll">전체글 관리</button> <button type="button" class="btn btn-default" id="btnNotice">공지사항</button>
<hr>

<table border="1px">
<tr>
	<td>제목</td>
	<td>${viewNotice.noticeTtl }</td>
</tr>
<tr>
	<td>글번호</td>
	<td>${viewNotice.noticeNo }</td>

	<td>작성일</td>
	<td><fmt:formatDate value="${viewNotice.noticeDate }" pattern="yyyy.MM.dd HH:mm:ss" /></td>

	<td>조회수</td>
	<td>${viewNotice.noticeHit }</td>
</tr>
<tr>
	<td>${viewNotice.noticeContent }</td>
</tr>
</table>

<hr>

<button id="btnUpdate">수정</button> <button id="btnDelete">삭제</button> <button id="btnWrite">글쓰기</button> <button id="btnList">목록</button>

</div>
</body>
</html>