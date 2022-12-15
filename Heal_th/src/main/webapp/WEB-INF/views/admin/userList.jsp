<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>

<style type="text/css">



</style>


	<h3>회원 목록</h3>
		<table>
			<tr>
				<th>회원번호</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>가입일</th>
				<th>포인트</th>
			</tr>
			<c:forEach items="${userList }" var="u">
			<tr>
				<td>${u.userNo }</td>
				<td>${u.userNick }</td>
				<td>${u.userId }</td>
				<td>${u.userName }</td>
				<td>${u.userGender }</td>
				<td>${u.userJoinDate }</td>
				<td>${u.point }</td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>