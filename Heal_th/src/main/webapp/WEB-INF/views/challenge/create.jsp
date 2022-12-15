<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.title {
	margin-bottom: 40px;
}

.container {
	border: 1px solid #333;
	width: 750px;
	height: 370px;
	text-align: center;
	margin-top: 400px;
}

label {
	display: block;
	margin: 10px 0;
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
			<p id="subv-content">원하는 챌린지를 만들어주세요</p>
		</div>
	</div>


	<div class="container">
		<div>🔔챌린지는 등록 후 수정이 불가합니다🔔</div>
		<form action="/challenge/create" method="post" id="createform">
			<div id="kind">
				<label for="challengeKind">챌린지 종류 </label> <select name="challengeKind" id="challengeKind">
					<option value="" selected disabled>종류 선택</option>
					<option value="실내운동">실내운동</option>
					<option value="실외운동">실외운동</option>
					<option value="기구운동">기구운동</option>
					<option value="맨몸운동">맨몸운동</option>
				</select>
			</div>
			<div>
				<label id="chl1"> 챌린지 이름 <input type="text" name="challengeName" id="name">
				</label>
			</div>
			<div>
				<label> 득근 머니 번호 <input type="text" name="mNo">
				</label>
			</div>
			<div>
				<label> 챌린지 생성일 <input type="date" name="challengeCredate">
				</label>
			</div>
			<div>
				<label> 챌린지 종료일 <input type="date" name="challengeEnddate">
				</label>
			</div>
			<div class="btn">
				<button type="submit" onclick="return confirm('챌린지는 등록후 수정이 불가합니다')">확인</button>
				<button type="reset">취소</button>

			</div>
		</form>
	</div>
</body>
<%@include file="../layout/footer.jsp"%>



<script type="text/javascript">
	$(document).ready(function() {

		//챌린지 만들기 form 전송
		$("#createbtn").click(function() {
			console.log("create success")

			$("#createform").submit();
		});

	});
</script>

</html>