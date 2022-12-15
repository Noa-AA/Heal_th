<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
</head>
<style type="text/css">
.joinList {
	display: flex;
	padding-top: 20px;
	padding-left: 530px;
	margin-bottom: -15px;
}
<
body
>
</style>
<div class="title">
	<h1 style="text-align: center">챌린지 마이페이지</h1>
</div>

<div class="mypage-list"></div>

<div class="page-content">

	<div>이름 : ${user.userName }</div>
	<div>아이디 : ${user.userId }</div>
	<div>가입한 챌린지 수 :</div>

	<div class="joinList">가입한 챌린지</div>
	<div class="challenge-content">
	<ul>
		<li>제목 : ${challenges.challengeNo }</li>
		<li>종류 : ${challenges.challengeKind }</li>
		<li>생성일 : ${challenges.challengeCredate }</li>
		<li>종료일 : ${challenges.challengeEnddate }</li>
	</ul>
	</div>
	<%-- 챌린지 참여자목록 : ${pList.userNo }   --%>
	


</div>
</body>
</html>