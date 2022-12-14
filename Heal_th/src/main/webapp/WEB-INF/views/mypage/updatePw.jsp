<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){

	})

		
	function chkUsingPw(){
		console.log("click")
		$("#chkUsingPwForm").submit()
	}	
</script>

<style type="text/css" >
#beforeUpdatePw{
	width: 1600px;
	margin : 0 auto;
	text-align: center;
}

</style>

<body>

<div id="beforeUpdatePw">
	<div id="title">
		<span style="font-size: 40px;">비밀번호 변경하기</span>
	</div>
	
	<div id="description">
		<span>비밀번호 변경 전 현재 사용 중인 비밀번호를 입력해주세요</span>
	</div>
	
	
	<form action="/mypage/chkUsingPw" method="post" id="chkUsingPwForm">
		<div id="showid"> 
			<label for="userId">	아이디
			<input type="text" id="userId" name="userId"  value="${userId}" readonly="readonly">
			</label>
		</div>
		
		<div id="inputUsingPw">
			<label for="userPw">현재 비밀번호
				<input type="text" id="userPw" name="userPw">
			</label>		
		</div>
	
		<div id="btn">
			<button type="button" id="chkPw" onclick="chkUsingPw()">비밀번호 확인</button>
			<button type="button" id="cancel">취소하기</button>
		</div>

	</form>

</div>

</body>
</html>