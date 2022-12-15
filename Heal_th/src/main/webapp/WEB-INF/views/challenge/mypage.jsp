<%@page import="hyunkyung.dto.Challenge"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<style type="text/css">
.mypage-list {
	width: 1200px;
}

.user-content {
	border: 1px solid #333;
	width: 1200px;
	text-align: center;
	margin: 18px 338px;
	line-height: 30px;
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
}

.join_list img {
	border: 0;
	margin-top: 20px;
	height: 100px;
	width: 200px;
}

.page-content {
	margin-top: 400px;
}

.challenge {
	position: relative;
	flex: 1 1 30%;
	border: 1px solid #333;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0/ 30%);
	border-radius: 10px;
	width: 400px;
	height: 300px;
	margin-top: 20px;
}

.challenge-content{
	margin-top: 30px;
}
</style>
</head>
<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">챌린지 마이페이지</p>
			<p id="subv-content">나의 챌린지를 확인해보세요</p>
		</div>
	</div>

	<div class="mypage-list">

		<div class="page-content">

			<div class="user-content">
				<div>이름 : ${user.userName }</div>
				<div>아이디 : ${user.userId }</div>
<%-- 				<div>가입한 챌린지 수 : ${total }</div> --%>
			</div>

			<div class="join_list">
				<div class="challenge-title">가입한 챌린지</div>
				<c:forEach items="${joinList }" var="joinList">
					<div class="challenge">
						<div class="challenge-thumbnail">
							<img src="/resources/img/chl_thumbnail/chl_thumb${joinList.challengeNo }.jpg" onerror="this.src='https://shared-comic.pstatic.net/thumb/webtoon/796152/thumbnail/thumbnail_IMAG10_a500c803-99ec-4bf8-92d1-b2a5c60c9789.jpg'">
						</div>
						<div class="challenge-content">
							<ul>
								<li>챌린지 번호 : ${joinList.challengeNo }</li>
								<li>제목 : <a class="move" href='<c:out value="${joinList.challengeNo}"/>'>
								<c:out value="${joinList.challengeName }"/></a></li>
								<li>종류 : ${joinList.challengeKind }</li>
								<li>생성일 : <fmt:formatDate value="${joinList.challengeCredate }" pattern="yyyy년 MM월 dd일" /></li>
								<li>종료일 : <fmt:formatDate value="${joinList.challengeEnddate }" pattern="yyyy년 MM월 dd일" /></li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	

</body>
<%@include file="../layout/footer.jsp"%>


<script>


</script>
</html>