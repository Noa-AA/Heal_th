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
ul{
	list-style: none;
}

.challenge{
	border: 1px solid black;
}

</style>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>





</head>

<body>
<h1>챌린지 리스트</h1>
<hr>


<div class="challenge-list">
<c:forEach items="${list }" var="challenge">

<div class="challenge">
<ul>
		<li>챌린지 번호 : <a href="./view?challengeNo=${challenge.challengeNo }">${challenge.challengeNo }</a></li>
		<li>챌린지 종류 : ${challenge.challengeKind }</li>
		<li>챌린지 이름 : ${challenge.challengeName }</li>
		<li>챌린지 생성일 : <fmt:formatDate value="${challenge.challengeCredate }" pattern="yyyy-MM-dd"/></li>
		<li>챌린지 종료일 : <fmt:formatDate value="${challenge.challengeEnddate }" pattern="yyyy-MM-dd"/></li>
</ul>
</div>
</c:forEach>
</div>

<span class="pull-right">total : ${paging.totalCount }</span>
<c:import url="/WEB-INF/views/challenge/layout/paging.jsp" />


<!-- <form action="/challenge/list" method="post"> -->
<!-- 	<!--  검색 시작  --> -->
<!-- 		<div class="search-area"> -->
<!-- 			<div class="form-item"> -->
<!-- 				<select class="form-control" name="searchType" id="searchType"> -->
<!-- 					<option value="party_boardtitle">제목</option> -->
<!-- 					<option value="partyLeader">파티장</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
<!-- 			<div class="form-item"> -->
<!-- 				<input type="text" class="form-control" name="keyword" id="keywordInput" > -->
<!-- 			</div> -->
<!-- 			<div class="form-item"> -->
<!-- 				<input type="submit" value="검색 "> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<!-- 검색 종료  --> -->

<!-- </form> -->
</body>
</html>