<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>

<style type="text/css">
.title{
	margin-bottom: 40px;
}

.container{
	border: 1px solid #333;
	text-align: center;
}

span{
	text-align: center;
}

.chl_info, .chl_mmoney, .chl_user{
/* 	text-align: center; */
	display: inline-block;
}

</style>
<body>
	<div class="title">
	<h1 style="text-align: center">가입 화면</h1>
	</div>

	<div class="container">
	<div>
		<span>챌린지 정보</span>
	</div>

	<div>
		<table class="chl_info">
			<tr>
				<td>챌린지 번호 : ${challenge.challengeNo }</td>
			</tr>
			<tr>
				<td>챌린지 종류 : ${challenge.challengeKind }</td>
			</tr>

			<tr>
				<td>챌린지 이름 : ${challenge.challengeName }</td>
			</tr>

			<tr>
				<td>챌린지 생성일 : <fmt:formatDate value="${challenge.challengeCredate }" pattern="yyyy-MM-dd"/></td>
			</tr>

			<tr>
				<td>챌린지 종료일 : <fmt:formatDate value="${challenge.challengeEnddate }" pattern="yyyy-MM-dd"/></td>
			</tr>

		</table>
	</div>

	<div>
		<span>챌린지 완료시 총 상금에 대한 설명</span>
	</div>

	<div>
		<span>결제 정보</span>
		<table class="chl_mmoney">
			<tr>
			<td>현재 보유 포인트 userNo.mCharge</td>
			
			</tr>
			<tr>
				<td>챌린지에 걸 포인트 mUse</td>
			</tr>
			
		
		</table>
	</div>

	<div>
		<table class="chl_user">
			<tr>
				<td>회원이름 userName</td>
			</tr>

			<tr>
				<td>아이디 userId</td>
			</tr>

			<tr>
				<td>이메일 userEmail</td>
			</tr>
			<tr>
				<td>연락처 userPhone</td>
			</tr>
		</table>
	</div>

	<div>
		<span>총 결제 포인트</span>
	</div>

	<form action="./complete" method="post">
	<div>
		<button>결제하기</button>
	</div>
	
	</form>
		<div>
			<button onclick="location.href='/challenge/list'">취소하기</button>
		</div>
	</div>
</body>
</html>