<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>로그인</h1>

<div id="loginFrom">
	<form action="/login/login" method="post">
		<div id="id">
			아이디
			<input type="text" name="userId">
		</div>
		
		<div id="pw">
			비밀번호 
			<input type="text" name="userPw">
		</div>

		<button>로그인</button>	
	</form>
	
	<a href="/login/join">회원가입</a>
</div>
</body>
</html>