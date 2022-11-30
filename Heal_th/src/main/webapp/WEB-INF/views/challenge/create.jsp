<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body>

	<h1>챌린지 만들기</h1>
	<hr>

	<form action="./create" method="post">
		<label>챌린지 종류 <input type="text" name="challengeKind"></label><br>
		<label>챌린지 이름 <input type="text" name="challengeName"></label><br>
		<label>득근 머니 번호 <input type="text" name="mNo"></label><br>
		<label>챌린지 생성일 <input type="date" name="challengeCredate"></label><br>
		<label>챌린지 종료일 <input type="date" name="challengeEnddate"></label><br><br>
		<button>확인</button>
	</form>
</body>
</html>