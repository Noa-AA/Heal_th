<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
.title {
	margin-bottom: 40px;
}

.container {
	border: 1px solid #333;
	width: 750px;
	height: 570px;
	margin-top: 400px;
}

#btnDelete {
	background:
		url(https://static-whale.pstatic.net/main/sprite-20220527@2x.png);
	margin-top: 16px;
	width: 25px;
	height: 25px;
	background-position: 117px 49px;
	border: 0 none;
}

.input_wrap {
	position: relative;
	text-align: center;
}

label {
	display: block;
	margin: 10px 0;
	/* 	font-size: 20px; */
}

input {
	padding: 5px;
	/* 	font-size: 17px; */
}

textarea {
	width: 800px;
	height: 200px;
	/* 	font-size: 15px; */
	padding: 10px;
}

.btn {
	border: 1px solid #333;
	font-weight: 600;
	top: 352px;
	text-align: center;
	cursor: pointer;
}

.btn_wrap {
	display: inline-block;
	text-align: center;
	padding: 1px 271px;
	margin-right: 10px;
	margin-left: 10px;
	margin-top: 50px;
}
</style>
</head>
<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">상세 조회 페이지</p>
			<p id="subv-content">해당 챌린지에 대한 상세 내용입니다</p>
		</div>
	</div>
	<div class="container">
		<div style="text-align: right;">
			<!-- 			<button id="btnDelete" onclick="return confirm('정말 삭제하실건가요?')"></button> -->
			<form method="get" action="./list" onsubmit="return cancelok(); ">
				<button type="submit" id="btnDelete"></button>
			</form>
		</div>
		<div class="input_wrap">
			<label>챌린지 번호</label> <input name="challengeNo" readonly="readonly" value='<c:out value="${pageInfo.challengeNo}"/>'>
		</div>
		<div class="input_wrap">
			<label>챌린지 종류</label> <input name="challengeKind" readonly="readonly" value='<c:out value="${pageInfo.challengeKind}"/>'>
		</div>
		<div class="input_wrap">
			<label>챌린지 이름</label> <input name="challengeName" readonly="readonly" value='<c:out value="${pageInfo.challengeName}"/>'>
		</div>
		<div class="input_wrap">
			<label>챌린지 생성일</label> <input name="challengeCredate" readonly="readonly" value='<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pageInfo.challengeCredate}"/>'>
		</div>
		<div class="input_wrap">
			<label>챌린지 종료일</label> <input name="challengeEnddate" readonly="readonly" value='<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pageInfo.challengeEnddate}"/>'>
		</div>


		<div class="btn_wrap">
			<button class="btn" id="list_btn" onclick="location.href='/challenge/list'">목록으로</button>
			<a class="btn" id="join_btn">가입하기</a>
		</div>
	</div>

	<form id="joinForm" action="/challenge/join" method="get">
		<input type="hidden" id="challengeNo" name="challengeNo" value='<c:out value="${pageInfo.challengeNo}"/>'>

	</form>


	<script>
		let form = $("#joinForm");

		//가입 버튼
		$("#join_btn").on("click", function(e) {
			form.attr("action", "/challenge/join");
			form.submit();
		});

		//삭제 버튼 (관리자만 보이게해야함)
		// 		$("#btnDelete")
		// 				.click(
		// 						function() {
		// 							location.href = "/challenge/delete?challengeNo=${pageInfo.challengeNo }"
		// 						});

		//삭제 버튼 (관리자만 보이게해야함)
		function cancelok() {
			if (confirm("진짜로 거래를 삭제하시겠습니까?")) {
				alert("정상적으로 처리 되었습니다.");
				return location.href = "/challenge/delete?challengeNo=${pageInfo.challengeNo }";
			} else {
				return false;

			}
		}
	</script>
</body>
<%@include file="../layout/footer.jsp"%>
</html>