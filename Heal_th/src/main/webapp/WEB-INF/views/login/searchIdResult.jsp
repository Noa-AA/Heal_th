<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<body>
<div id="findIdResult">
	
	<div id="resultId">
		<span id="pringId">회원님의 아이디 는 ${userId }입니다.</span>
		
	</div>
	<div id="btnArea">
		<button type="button" id="btnGotoLogin" onclick="location.href='/login/login'">로그인하러 가기</button>
	</div>


</div>



</body>
</html>