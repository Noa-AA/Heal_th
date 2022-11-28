<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


회원 가입

<div id="joinform">
	<form action="/login/join" method="post">
		<div id="name">		
		 	<label for="userName">이름</label> 
	 		<input type="text" name="userName" id="userName">
		</div>
	
		<div id="email">
			<label for="userEmail">이메일</label>
			<input type="text" name="userEmail" id="userEmail">
		</div>
		<div id="id">
			<label for="userId">아이디</label>
			<input type="text" name="userId" id="userId">
		</div>
	
		<div id="pw">
			<label for="userPw">비밀번호</label>
			<input type="text" name="userPw" id="userPw">
		</div>
		
		<div id="nick">
			<label for="userNick">닉네임</label>
			<input type="text" name="userNick" id="userNick">
		</div>
		<div id="phone">
			<label for="userPhone">연락처</label>
			<input type="text" name="userPhone" id="userPhone">
		</div>
		
	
		<div id="address">
			<label for="userAddress">주소</label>
			<input type="text" name="userAddress" id="userAddress">
		</div>
		
		
		<button id="joinbtn">가입 완료</button>
	
	</form>

</div>
</body>
</html>