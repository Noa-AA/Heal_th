<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp"%>

<style type="text/css">

.container{
	margin-top: 400px;
}
#chlInfo_title {
	width: 200px;
	height: 30px;
	border-radius: 20px;
}

#chlInfo_title span {
	/* 	display: inline-block; */
	font-size: 20px;
	background-color: #c583d6;
	color: white;
}

#chlInfo_area {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#chlInfo {
	width: 1200px;
	height: 200px;
	font-size: 15px;
	font-weight: 500;
}

#reward_title span {
	/* 	display: inline-block; */
	margin-top: 40px;
	font-size: 20px;
	background-color: #c583d6;
	color: white;
}

#reward_area {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#rewardInfo {
	width: 1200px;
	height: 200px;
	font-size: 15px;
	font-weight: 500;
}

#Mmoney_title span {
	display: inline-block;
	font-size: 20px;
	background-color: #c583d6;
	color: white;
}

#mmoney_area {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#MmoneyInfo {
	width: 1200px;
	height: 200px;
	font-size: 15px;
	font-weight: 500;
}

#user_title span {
	font-size: 20px;
	background-color: #c583d6;
	color: white;
}

#user_area {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#userInfo {
	width: 1200px;
	height: 200px;
	font-size: 15px;
	font-weight: 500;
}

#total_title span {
	display: inline-block;
	font-size: 20px;
	background-color: #c583d6;
	color: white;
}

#total_area {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

span {
	text-align: center;
	font-weight: 600;
}
</style>
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">가입 화면</p>
		<p id="subv-content">해당 챌린지에 가입할 수 있습니다</p>
	</div>
</div>
	<div class="container">
		<div id="chlInfo_title">
			<span>챌린지 정보</span>
		</div>

		<div id="chlInfo_area">
			<table id="chlInfo">

				<tr id="challengeNo">
					<td>챌린지 번호 : ${challenges.challengeNo }</td>
				</tr>

				<tr id="challengeKind">
					<td>챌린지 종류 : ${challenges.challengeKind }</td>
				</tr>

				<tr id="challengeName">
					<td>챌린지 이름 : ${challenges.challengeName }</td>
				</tr>

				<tr id="challengeCredate">
					<td>챌린지 생성일 : <fmt:formatDate value="${challenges.challengeCredate }" pattern="yyyy-MM-dd" /></td>
				</tr>

				<tr id="challengeEnddate">
					<td>챌린지 종료일 : <fmt:formatDate value="${challenges.challengeEnddate }" pattern="yyyy-MM-dd" /></td>
				</tr>

			</table>
		</div>
<%-- 		</c:forEach> --%>

		<div id="reward_title">
			<span>총 상금에 대한 설명</span>
		</div>

		<div id="reward_area">
			<table id="rewardInfo">
				<tr>
					<td>100% 성공 : 예치금 전액 + 상금</td>
				</tr>

				<tr>
					<td>85%이상 성공 : 예치금 전액 환급</td>
				</tr>

				<tr>
					<td>예치금 일부 환급(성공률 만큼)</td>
				</tr>

			</table>

		</div>

		<div id="Mmoney_title">
			<span>결제 정보</span>
		</div>

		<div id="mmoney_area">
			<table id="MmoneyInfo">
				<tr id="mCharge">
					<td>보유 득근머니 : ${mmoney.mCharge }</td>

				</tr>
				<tr class="mUse">
					<td>예치금으로 걸 금액 : <input type="text" name="mUse" placeholder="최소금액 1000원"><button>확인</button></td>
				</tr>
			</table>
		</div>


		<div id="user_title">
			<span>회원 정보</span>
		</div>

		<div id="user_area">
			<table id="userInfo">
				<tr id="userName">
					<td>회원이름 : ${user.userName }</td>
				</tr>

				<tr id="userPhone">
					<td>연락처 : ${user.userPhone }</td>
				</tr>

				<tr id="userEmail">
					<td>이메일 : ${user.userEmail }</td>
				</tr>
				<tr id="userNo">
					<td>회원번호 : ${user.userNo }</td>
				</tr>
			</table>
		</div>

		<div id="total_title">
			<span>total</span>
		</div>

		<div id="total_area">
			<table id="total">
			<tr>
				<td> ${mmoney.mUse} </td>
			</tr>
			</table>
		
		</div>
		
		<form action="./join" method="post">
			<div id="btnarea">
				<button>결제하기</button>
			</div>

		</form>
		<div>
			<button onclick="location.href='/challenge/list'">취소하기</button>
		</div>
		</div>
</body>
<%@include file="../layout/footer.jsp" %>
</html>