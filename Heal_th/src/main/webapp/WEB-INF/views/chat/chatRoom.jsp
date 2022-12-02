<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>

<h1>아아디 : ${userId }님의 채팅목록 </h1>
<hr>

<table>

<c:forEach items="${roomList }" var="room">
<tr>	
	<th>
<%-- 		<a href="/chat/intro?userNo=${userList.userNo }"> --%>
		${room.roomNo }번방
<!-- 		</a> -->
	</th>
</tr>

</c:forEach>
</table>

<body>

</body>
</html>