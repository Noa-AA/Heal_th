<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>챌린지 상세정보</h1>

<table>
<tr>
	<td>챌린지 번호 : ${viewChallenge.challengeNo }</td>
</tr>
<tr>
	<td>챌린지 종류 : ${viewChallenge.challengeKind }</td>
</tr>
<tr>
	<td>챌린지 이름 : ${viewChallenge.challengeName }</td>
</tr>
<tr>
	<td>챌린지 생성일 : <fmt:formatDate value="${viewChallenge.challengeCredate }" pattern="yyyy-MM-dd"/></td>
</tr>
<tr>
	<td>챌린지 종료일 : <fmt:formatDate value="${viewChallenge.challengeEnddate }" pattern="yyyy-MM-dd"/></td>
</tr>

</table>
<form action="/challenge/join" method="get">
<button>가입하기</button>
</form>

<form action="/challenge/list" method="get">
<button>목록으로</button>
</form>

</body>
</html>