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

<div class="container">
<button>전체글 관리</button> <button>공지사항</button>
<hr>

<table>
<tr>
	<td>제목</td>
	<td>${viewNotice.noitceTtl }</td>
</tr>
<tr>
	<td>글번호</td>
	<td>${viewNotice.noitceNo }</td>

	<td>작성일</td>
	<td>${viewNotice.noitceDate }</td>

	<td>조회수</td>
	<td>${viewNotice.noitceHit }</td>
</tr>
<tr>
	<td>${viewNotice.noitceContent }</td>
</tr>
</table>

</div>
</body>
</html>