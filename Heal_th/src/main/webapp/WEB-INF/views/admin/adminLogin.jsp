<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	 //아이디 입력창에 포커스 주기
    $("input").eq(0).focus()
	
	
	// 로그인 재시도시 input 박스 초기화
	   //input박스 초기화
	$("#adminId").focus(function(){
		    $("#result").html("");
	})
	
	$("#adminPw").focus(function(){
		    $("#result").html("");
	})
	
	
		
})

</script>

<style type="text/css">
	#adminLogin{
		width: 500px;
		margin : 0 auto;
	}

</style>

<body>

<div id="adminLogin">
		<div id="intro">
			<h1 id="title">로그인</h1>
		</div>
		<div id="formarea">
			<form action="/admin/adminLogin" method="post" id="adminLoginForm">
			
				<div id="id">
					<label for="adminId">아이디
						<input id="adminId" name="adminId" placeholder="관리자 아이디를 입력하세요">
					</label>
				</div>
				<div id="pw">
					<label for="adminPw">비밀번호
						<input id="adminPw" name="adminPw" placeholder="관리자 비밀번호를 입력하세요">
					</label>
				</div>
			
				<c:if test="${isAdminLogin == false}">
				
					<div id="resultAdminLogin">
						<span style="color:red;" id="result">아이디 또는 비밀번호를 다시 한번 확인해주세요</span>
					</div>
				</c:if>
			
				<button id="btnAdminLogin"> 로그인</button>
			
			</form>
			
		
		
		</div>



</div>

</body>
</html>