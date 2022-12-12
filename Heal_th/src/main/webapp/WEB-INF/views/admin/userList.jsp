<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<body>
	<div>
		<table>
			<c:forEach items="${userList }" var="u">
			<tr>
				<th>회원번호</th>
				<th>닉네임</th>
				<th>연락처</th>
				<th>주소</th>
				<th>이름</th>
				<th>성별</th>
				<th>포인트</th>
			</tr>
			<tr>
				<td>${u.userNo }</td>
				<td>${u.userNick }</td>
				<td>${u.userPhone }</td>
				<td>${u.userAddress }</td>
				<td>${u.userName }</td>
				<td>${u.userGender }</td>
				<td>${u.point }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>