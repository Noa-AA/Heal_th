<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#twoDepth-list a:nth-child(2) {
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

#twoDepth-list a {
	width: 33.3%;
}

.title {
	margin-bottom: 40px;
}


.container {
	border: 1px solid #cfcfcf;
	border-radius: 10px;
	box-shadow: 1px 1px 8px 0px rgb(0 0 0/ 10%);
	width: 600px;
	height: 360px;
	text-align: center;
	margin-top: -142px;
	line-height: 30px;
	margin-top: 40px;
}

label {
	display: block;
	margin: 22px 0;
}

input {
	padding: 5px;
}

button {
	width: 100px;
	height: 36px;
}
</style>
</head>
<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">챌린지 만들기</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<div id="twoDepth-list">
				<a href="/challenge/list">챌린지 리스트</a>
				<a href="/challenge/create">챌린지 만들기</a>
				<a href="/challenge/mypage">챌린지 마이페이지/인증</a>
			</div>
		</div>
	</div>
	<div class="container">
		<form action="/challenge/create" method="post" id="createform">
			<div id="kind">
				<label for="challengeKind">
					챌린지 종류 : 
					<select name="challengeKind" id="challengeKind">
						<option value="" selected disabled>종류 선택</option>
						<option value="실내운동">실내운동</option>
						<option value="실외운동">실외운동</option>
						<option value="기구운동">기구운동</option>
						<option value="맨몸운동">맨몸운동</option>
					</select>
				</label>
			</div>
			<div>
				<label id="chl1">
					챌린지 이름 : 
					<input type="text" name="challengeName" id="name">
				</label>
			</div>
			<div>
				<label>
					챌린지 생성일 : 
					<input type="date" name="challengeCredate">
				</label>
			</div>
			<div>
				<label>
					챌린지 종료일 :    
					<input type="date" name="challengeEnddate">
				</label>
			</div>
			<div class="btn">
				<button type="submit" onclick="return confirm('챌린지는 등록후 수정이 불가합니다')">확인</button>
			</div>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
<%@include file="../layout/footer.jsp"%>
</html>