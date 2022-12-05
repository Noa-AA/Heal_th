<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>공지사항</h1>
<hr>

<table border="1px">
<thead>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성일자</th>
		<th>조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.noticeNo }</td>
		<td>${notice.noticeTtl }</td>
		<td><fmt:formatDate value="${notice.noticeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td>${notice.noticeHit }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>
