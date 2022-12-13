<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>

<style type="text/css">
.title{
	margin-bottom: 40px;
}

.container{
	border: 1px solid #333;
	width: 750px;
	height: 330px;
	text-align: center;
}

label {
	display: block;
	margin: 10px 0;
}

input{
	padding: 5px;
}

button{
	width: 100px;
	height: 36px;
}
</style>
</head>
<body>
	<div class="title">
	<h1 style="text-align: center">챌린지 만들기</h1>
	</div>

	<div class="container">
	<form action="./create" method="post">
		<div>
			<label>챌린지 종류 <input type="text" name="challengeKind"></label>
		</div>
		<div>
			<label>챌린지 이름 <input type="text" name="challengeName"></label>
		</div>
		<div>
			<label>득근 머니 번호 <input type="text" name="mNo"></label>
		</div>
		<div>
			<label>챌린지 생성일 <input type="date" name="challengeCredate"></label>
		</div>
		<div>
			<label>챌린지 종료일 <input type="date" name="challengeEnddate"></label>
		</div>
		<div class="btn">
		<button>확인</button>
		</div>
	</form>
	</div>
</body>
</html>