<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<style type="text/css">

#newPw{
	width: 500px;
	margin: 0 auto;


}

</style>

<body>

<div id="newPw">

	<h1>비밀번호 재설정</h1>
	<div id="updatePw">
		<label for="userPw">비밀번호 
			<input type="text" name="userPw" id="userPw">
		</label>
	</div>

	<div id="chkUpdatePw">
		<label for="chkPw"> 비밀번호 확인
			<input type="text" name="chkuserPw" id="userchkPw">
		</label>
	</div>
	
	<button  type="button" id="btnUpdatePw">비밀번호 설정하기</button>

</div>


</body>
</html>