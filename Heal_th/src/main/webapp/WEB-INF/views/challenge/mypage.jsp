<%@page import="hyunkyung.dto.Challenge"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<style type="text/css">
#twoDepth-list a:nth-child(3) {
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

#twoDepth-list a {
	width: 33.3%;
}

.mypage-list {
	width: 1200px;
}

.user-content {
	border: 1px solid #cfcfcf;
	border-radius: 10px;
	box-shadow: 1px 1px 8px 0px rgb(0 0 0/ 10%);
	width: 600px;
	text-align: center;
	margin: 52px 640px;
	line-height: 30px;
}

.challenge-title {
	text-align: center;
	width: 1200px;
	margin: 18px 338px;
	font-size: 20px;
}

.join_list {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: auto;
	gap: 50px 50px;
	padding-top: 20px;
	margin-bottom: -15px;
	text-align: center;
	width: 1200px;
	margin: 18px 338px;
}

.join_list img {
	border: 0;
	margin-top: 35px;
	height: 100px;
	width: 200px;
}

li {
	line-height: 25px;
}

.chlTitle {
	font-weight: 600;
	font-size: 15px;
}

.page-content {
	margin-top: 40px;
	text-align: center;
}

.challenge {
	position: relative;
	flex: 1 1 30%;
	border: 1px solid #cfcfcf;
	box-shadow: 1px 1px 8px 0px rgb(0 0 0/ 10%);
	border-radius: 10px;
	width: 400px;
	height: 300px;
	margin-top: 20px;
}

.challenge-content {
	margin-top: 30px;
}
</style>
</head>
<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">챌린지 마이페이지</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<a href="/challenge/list">챌린지 리스트</a>
			<a href="/challenge/create">챌린지 만들기</a>
			<a href="/challenge/mypage">챌린지 마이페이지/인증</a>
		</div>
	</div>

	<div class="mypage-list">

		<div class="page-content">

			<div class="user-content">
				<div>이름 : ${user.userName }</div>
				<div>아이디 : ${user.userId }</div>
			</div>

			<div class="challenge-title">${user.userName }님이 가입한 챌린지</div>
			<div class="join_list">
				<c:forEach items="${joinList }" var="joinList">
					<div class="challenge">
						<div class="challenge-thumbnail">
							<a class="move" href='<c:out value="${joinList.challengeNo}"/>'>
								<img src="/resources/img/chl_thumbnail/chl_thumb${joinList.challengeNo }.jpg" onerror="this.src='https://shared-comic.pstatic.net/thumb/webtoon/796152/thumbnail/thumbnail_IMAG10_a500c803-99ec-4bf8-92d1-b2a5c60c9789.jpg'">
							</a>
						</div>
						<div class="challenge-content">
							<ul>
<%-- 								<li>챌린지 번호 : ${joinList.challengeNo }</li> --%>
								<li class="chlTitle">
									제목 :
									<a class="move" href='<c:out value="${joinList.challengeNo}"/>'>
										<c:out value="${joinList.challengeName }" />
									</a>
								</li>
								<li>종류 : ${joinList.challengeKind }</li>
								<li>
									생성일 :
									<fmt:formatDate value="${joinList.challengeCredate }" pattern="yyyy년 MM월 dd일" />
								</li>
								<li>
									종료일 :
									<fmt:formatDate value="${joinList.challengeEnddate }" pattern="yyyy년 MM월 dd일" />
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" id="challengeNo" name="challengeNo" value='<c:out value="${pageInfo.challengeNo}"/>'>

	</form>
</body>
<%@include file="../layout/footer.jsp"%>


<script>
	//사진인증 페이지
	let moveForm = $("#moveForm");
	$(".move")
			.on(
					"click",
					function(e) {
						e.preventDefault();
						moveForm.empty();
						moveForm
								.append("<input type='hidden' name='challengeNo' value='"
										+ $(this).attr("href") + "'>");
						moveForm.attr("action", "/challenge/photopage");
						moveForm.submit();
					});
</script>
</html>