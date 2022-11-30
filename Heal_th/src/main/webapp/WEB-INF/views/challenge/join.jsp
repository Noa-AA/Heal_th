<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>가입 화면</h1>


	<div>
		<span>챌린지 정보</span>
	</div>

	<div>
		<table>
			<tr>
				<td>챌린지 번호 : ${viewChallenge.challengeNo }</td>
			</tr>
			<tr>
				<td>챌린지 종류</td>
			</tr>

			<tr>
				<td>챌린지 이름 : ${viewchallenge.challengeName }</td>
			</tr>

			<tr>
				<td>챌린지 생성일</td>
			</tr>

			<tr>
				<td>챌린지 종료일</td>
			</tr>

		</table>
	</div>

	<div>
		<span>챌린지 완료시 총 상금에 대한 설명</span>
	</div>

	<div>
		<span>결제 정보</span>
	</div>

	<div>
		<table>
			<tr>
				<td>회원이름</td>
			</tr>

			<tr>
				<td>아이디</td>
			</tr>

			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td>연락처</td>
			</tr>
		</table>
	</div>

	<div>
		<span>총 결제 포인트</span>
	</div>

	<div>
		<button>결제하기</button>
	</div>
	<form action="./list" method="post">
		<div>
			<button>취소하기</button>
		</div>
	</form>
</body>
</html>