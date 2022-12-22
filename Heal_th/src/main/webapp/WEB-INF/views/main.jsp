<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./layout/header.jsp" %>

<style type="text/css">
body {
	padding: 0;
}

.main-first-wrap {
	width: 1600px;
	margin: 0 auto;
	display: flex;
}

.main-first-wrap img {
	width: 65%;
}

.main-first-wrap .left {
	width: 750px;
	margin: 10px;
	display: flex;
	margin-top: 50px;
}

.main-first-wrap .right {
	width: 750px;
	margin: 10px;
	display: flex;
	flex-direction: column;
	padding-top: 100px;
}

.main-second-wrap {
	width: 100%;
	border: 1px solid silver;
	height: 600px;
	display: flex;
	margin-top: 100px;
}

.main-second-wrap #first {
	width: 25%;
	height: 600px;
	border: 1px solid silver;
	
}

.main-second-wrap #second {
	width: 25%;
	height: 600px;
	border: 1px solid silver;
}

.main-second-wrap #third {
	width: 25%;
	height: 600px;
	border: 1px solid silver;
}

.main-second-wrap #fourth {
	width: 25%;
	height: 600px;
	border: 1px solid silver;
}

.main-third-wrap {
	width: 1500px;
	margin: 0 auto;
	margin-top: 100px;
}

.main-fourth-wrap {
	width: 1500px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
}

.newsroom-wrap {
	display: flex;
	margin: 0 auto;
	padding: 10px;
}

.main-fourth-wrap #newsroom-first {
	width: 30%;
	height: 300px;
	border: 1px solid silver;
	margin: 20px;
}

.main-fourth-wrap #newsroom-second {
	width: 30%;
	height: 300px;
	border: 1px solid silver;
	margin: 20px;
}

.main-fourth-wrap #newsroom-third {
	width: 30%;
	height: 300px;
	border: 1px solid silver;
	margin: 20px;
}
</style>
<body>
	<div class="main-first-wrap">
		<div class="left">
			<img src="/resources/img/logo_purple.png"/>
		</div>
		<div class="right">
			<h3>운동의 패러다임을 바꾸다</h3><br><br>
			<p>Heal_th는 현대인의 지친 몸을 어쩌구 저쩌구</p>
			<p>Heal_th는 현대인의 지친 몸을 어쩌구 저쩌구</p>
		</div>
	</div>
	<div class="main-second-wrap">
		<div id="first">
		<p>챌린지</p>
		</div>
		<div id="second">
		<p>운동 질문</p>
		</div>
		<div id="third">
		<p>운동 도우미</p>
		</div>
		<div id="fourth">
		<p>득근 상점</p>
		</div>
	</div>
	<div class="main-third-wrap">
		<h1>WHO WE ARE</h1>
		<p>어쩌구저쩌구</p>
	</div>
	
	<div class="main-fourth-wrap">
		<h1>NEWS ROOM</h1>
		<div class="newsroom-wrap">
			<div id="newsroom-first"></div>
			<div id="newsroom-second"></div>
			<div id="newsroom-third"></div>
		</div>
	</div>
</body>
<%-- <%@include file="./layout/footer.jsp" %> --%>
</html>