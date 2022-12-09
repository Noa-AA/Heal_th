<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	//취소버튼 클릭
	$("#btnCancel").click(function(){
		 console.log("취소하기")
		 history.go(-1)
	})	
	
	//serachPwResult 초기화
	$("#userName").focus(function(){
		$("#searchPwResult").html("")
		$("#searchPwResult").css("color","black")
	})
	$("#userId").focus(function(){
		$("#searchPwResult").html("")
		$("#searchPwResult").css("color","black")
	})
	$("#userPhone").focus(function(){
		$("#searchPwResult").html("")
		$("#searchPwResult").css("color","black")
	})
	$("#pwSmsCode").focus(function(){
		$("#searchPwResult").html("")
		$("#searchPwResult").css("color","black")
	})
	
	
	//인증번호 받기 
	$("#btnSearchPw").click(function(){
		 console.log("인증번호 받기 버튼 클릭")
		 $.ajax({
		
			 type:"post"
			 ,url:"/login/searchPw"
			 ,data:{
				 userName: $("#userName").val()
				 ,userId : $("#userId").val()
				 ,userPhone: $("#userPhone").val()
			 }
			 ,dataType:"json"
			 ,success :function(res){
				 console.log(res)
				 console.log("인증번호 받기")
				 if(res==true) {
					console.log("회원 있음")
					$("#pwSmsCode").attr("disabled",false)
					$("#pwSmsCode").focus()
				 }else {
					 console.log("회원 없음")
					 $("#searchPwResult").html("일치하는 회원정보가 없습니다.이름,아이디,전화번호를 확인해주세요")
					 $("#searchPwResult").css("color","red")
				 }
			 }
			 ,eroor:function(){
				 console.log("오류입니다.")
				 alert("시스템 오류  다시 진행해주세요")
			 }
		 })
		 
	}) //문자 보내기 완료 
	
 	$("#btnChk").click(function(){
		$.ajax({
			type:"post"
			,url:"/login/codeChkForPw"
			,data:{
				pwSmsCode: $("#pwSmsCode").val()
			}
			,dataType:"json"
			,success:function(res){
				console.log(res)
				console.log("인증번호 검사하기")
				if(res){
					console.log("인증번호 검사 성공")
					location.href="/login/makeNewPw"
				}else {
					console.log("인증번호 검사 실패")
					 $("#searchPwResult").html("인증실패! 인증번호를 확인해주세요")
					$("#searchPwResult").css("color","red")
				}
			}
			,error :function(){
				 console.log("오류입니다.")
				 alert("시스템 오류  다시 진행해주세요")
			 
			}
			
			
		})//인증번호 검사하기
	 
	 })


})//ready


	



</script>



<style type="text/css">
#searchPw{
	width: 500px;
	margin: 0 auto;

}

</style>

<body>

<div id="searchPw">
	
		<h1>비밀번호 찾기</h1>
		<div id ="searchPwForm">
		
			<div id="name">
			<label for="userName">이름
				<input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요">
			</label>
			
			</div>
			<div id="id">
				<label for="userId">아이디
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요">
				</label>
			</div>		
			
			<div id="phone">
				<label for="userPhone">전화번호
				<input type="text" name="userPhone" id="userPhone" placeholder="전화번호를 입력해주세요">
				</label>
			</div>
			
			<div id="btnGetCode">
				<button type="button" id="btnSearchPw">인증번호받기</button>
			</div>
			
			<div id="pwCode">
				<label for="pwSmsCode">
				<input type="text" name="pwSmsCode" id="pwSmsCode" placeholder="인증번호를 입력해주세요" disabled>
				</label>
			</div>
			
			<div id="btnChkCode">
				<button type="button" id="btnChk">인증번호확인</button>
			</div>
		</div>
			<div id="searchPwResult"></div>
		
		<button type="button" id="btnCancel">취소하기</button>
		<button type="button" id="btnGotoSearchId" onclick="location.href='/login/searchId'">아이디 찾기</button>
		
		

</div>

</body>
</html>