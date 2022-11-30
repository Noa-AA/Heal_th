<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../layout/header.jsp" %>

<style type="text/css">

h2{
	width: 1600px;
	margin: 0 auto;
	text-align: center;
}

table {
	margin: 0 auto;
}

table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}



</style>

<body>

<h2 id="title">멘토 리스트</h2>
<br>


<table>
<tr>
	<th>유저번호</th>
	<th>이름</th>
	<th>직업</th>
	<th>한말씀</th>
	<th>성별</th>
	<th>회원등급</th>
</tr>

<c:forEach items="${userList }" var="userList">
<tr>
	<th>
		<a href="/chat/intro?userNo=${userList.userNo }">
			${userList.userNo }
		</a>
	</th>
	
	<th>${userList.userName }</th>
	<th>${userList.userJob }</th>
	<th>${userList.userIntro }</th>
	<th>${userList.userGender }</th>
	<th>${userList.rankingNo }</th>
</tr>

</c:forEach>
</table>




</body>
</html>