<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<style type="text/css">
body{
	padding-top:0;

}
#completeJoin{
	width: 1400px;
    margin: 0 auto;
    text-align: center;
    padding-top: 143px;;

}

#msg{
	margin-top: 100px;
}

#welcome{
	font-size: 50px;
}
.joinMsg,.loginTitle{
	font-size: 20px;
}

#loginLink{
	text-decoration: none;
	
	color:inherit;
}


.loginTitle:hover{
	color: #7ca3f5;
}
</style>
<body id="doneBody">
<div id="completeJoin">
	<div id="log">
	
		<img id="loginImg" src="/resources/img/login/HealLogo.png">		
	</div>
	<div id="msg">
		<p id="welcome">환영합니다</p>
		
		<span class="joinMsg">Heal_th의 회원이 되신 것을 축하드립니다!</span>
	</div>
	
	<div id="gpToLogin goToLogin">
		<a href="/login/login" id="loginLink"><span class="loginTitle">로그인하기</span></a>
	</div>
</div>
</body>
<jsp:include page="../layout/footer.jsp"/>

</html>