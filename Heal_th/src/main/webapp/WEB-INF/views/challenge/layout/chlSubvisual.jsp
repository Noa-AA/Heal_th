<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#twoDepth-list a:nth-child(1) {
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

#twoDepth-list a {
	width: 33.3%;
}


</style>
<title>Insert title here</title>
</head>
<body>


	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">챌린지 리스트</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<a href="/challenge/list">챌린지 리스트</a>
			<a href="/challenge/create">챌린지 만들기</a>
			<a href="/challenge/mypage">챌린지 마이페이지/인증</a>
		</div>
	</div>

</body>
</html>