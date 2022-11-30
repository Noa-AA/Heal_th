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
<h1>인출신청내역 조회</h1>

<table>
	<tr>
	<c:forEach items="${withDraw }" var="w">
		<td>${w.wdNo }</td>
		<td>${w.wdAmount }</td>
		
	</c:forEach>
	</tr>
</table>
</body>
</html>