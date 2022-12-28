<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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

.title {
	margin-bottom: 40px;
}

.view-container {
	border: 1px solid #333;
	width: 750px;
	height: 530px;
	margin-top: 40px;
	margin: 0 auto;
}

#btnDelete {
	background:
		url(https://static-whale.pstatic.net/main/sprite-20220527@2x.png);
	margin-top: 16px;
	width: 25px;
	height: 25px;
	background-position: 117px 49px;
	border: 0 none;
	margin: 8px 6px;
}

.chl_wrap {
	position: relative;
	text-align: center;
	line-height: 30px;
	margin-top: 40px;
}

label {
	display: inline-block;
	margin: 10px 0;
	/* 	font-size: 20px; */
	margin: 0px 16px;
}

input {
	padding: 5px;
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
	<!-- 관리자 로그인 상태일때 -->
	<c:if test="${!empty adminNo && empty userId}">
		<jsp:include page="../layout/adminheader.jsp" />
	</c:if>

	<!-- 회원 로그인 상태일때 -->
	<c:if test="${empty adminNo}">
		<%@include file="../layout/header.jsp"%>
		<%-- 		<jsp:include page="./layout/subvisual.jsp" /> --%>
	</c:if>
	
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">챌린지 상세보기</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<div id="twoDepth-list">
				<a href="/challenge/list">챌린지 리스트</a>
				<a href="/challenge/create">챌린지 만들기</a>
				<a href="/challenge/mypage">챌린지 마이페이지</a>
			</div>
		</div>
	</div>

	<div class="view-container">
		<div style="text-align: right;">
			<form method="get" action="./list" onsubmit="return cancelok(); ">
				<!-- 	관리자만 버튼 보이게 -->
				<c:if test="${! empty adminNo}">
					<button type="submit" id="btnDelete"></button>
				</c:if>
			</form>
		</div>
		<div class="chl_wrap">
			<label>챌린지 번호</label>
			<input name="challengeNo" readonly="readonly" value='<c:out value="${pageInfo.challengeNo}"/>'>
		</div>
		<div class="chl_wrap">
			<label>챌린지 종류</label>
			<input name="challengeKind" readonly="readonly" value='<c:out value="${pageInfo.challengeKind}"/>'>
		</div>
		<div class="chl_wrap">
			<label>챌린지 이름</label>
			<input name="challengeName" readonly="readonly" value='<c:out value="${pageInfo.challengeName}"/>'>
		</div>
		<div class="chl_wrap">
			<label>챌린지 생성일</label>
			<input name="challengeCredate" readonly="readonly" value='<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pageInfo.challengeCredate}"/>'>
		</div>
		<div class="chl_wrap">
			<label>챌린지 종료일</label>
			<input name="challengeEnddate" readonly="readonly" value='<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pageInfo.challengeEnddate}"/>'>
		</div>


		<div class="btn_wrap">
			<button class="btn" id="list_btn" onclick="location.href='/challenge/list'">목록으로</button>
			<button class="btn" id="join_btn">가입하기</button>
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
		function cancelok() {
			if (confirm("해당 챌린지를 삭제하시겠습니까?")) {
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