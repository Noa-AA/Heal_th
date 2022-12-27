<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
#twoDepth-list a {
	width: 33.3%;
}


</style>
</head>
<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">결제 성공</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<a href="/challenge/list">챌린지 리스트</a>
			<a href="/challenge/create">챌린지 만들기</a>
			<a href="/challenge/mypage">챌린지 마이페이지/인증</a>
		</div>
	</div>

	<h1>결제 성공</h1>


</body>
<%@include file="../layout/footer.jsp"%>
</html>