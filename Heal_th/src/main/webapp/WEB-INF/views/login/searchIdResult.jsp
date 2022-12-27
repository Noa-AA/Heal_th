<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<body>
<div id="findIdResult">
	
	<div id="resultId">
		<c:choose>
			<c:when test="${userId.jointype eq'Kakao'}">
				<span id="printIdK">회원님은 카카오아이디로 회원가입하셨습니다.</span>
				
			</c:when>
			<c:when test="${userId.jointype eq'Naver'}">">
				<span id="printIdN">회원님은 네이버아이디로 회원가입하셨습니다.</span>
			</c:when>	
			<c:otherwise>
				<span id="prinㅅId">회원님의 아이디 는 ${userId.userId }입니다.</span>
			</c:otherwise>
		</c:choose>
		
		
	</div>
	<div id="btnArea">
		<button type="button" id="btnGotoLogin" onclick="location.href='/login/login'">로그인하러 가기</button>
	</div>


</div>



</body>
</html>