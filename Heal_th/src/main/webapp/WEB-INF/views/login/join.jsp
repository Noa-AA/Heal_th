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

<div id="join form">
	<form action="login/join" method="post">
		<div id="name">		
		 	<label for="userName">이름</label> 
	 		<input type="text" name="userName" id="userName">
		</div>
	
		<div id="userId">
			<label for="userId">아이디</label>
			<input type="text" name="userId" id="userId">
		</div>
	
		<div id="userPw">
			<label for="userPw">비밀번호</label>
			<input type="text" name="userPw" id="userPw">
		</div>
		
		<div id="userNick">
			<label for="userNick">닉네임</label>
			<input type="text" name="userNick" id="userNick">
		</div>
		
		
		
	
	</form>

</div>
</body>
</html>