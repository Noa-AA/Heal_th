<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function(){

	   $("#userPw").focus(function(){
		   $("#resultMsg").html("")
	   })
	   $("#userchkPw").focus(function(){
		   $("#resultMsgChk").html("")
	   })
	   //비밀번호 확인 안했을 때의 처리
	
	
	//비밀번호 유효성 검사
	$("#userPw").change(function(){
		console.log("비밀번호 유효성 검사 -updatePw")
		validateUpdatePw()
		
		//기존에 사용한 비밀번호인지 확인하기
		$.ajax({
			type : "post"
			,url: "/login/usedPwChk"
			,data:{
				userPw : $("#userPw").val()
			}
		,dataType :"json"
		,success : function (res){
			console.log(res)
			console.log("사용된 비밀번호 확인")
				validateUpdatePw()
			
			if(!res){
				console.log(res)
				console.log("비밀번호 재설정 불가")
				 $("#resultMsg").html("이미 사용중인 비밀번호입니다.")
					$("#resultMsg").css("color","red")
				}
			
			}
			
		})
		
		
	})
	
  //비밀번호 재확인
	$("#userchkPw").keyup(function(){
		console.log("비밀번호 입력 확인")
		validateCkh()
	})

	//비밀번호 바꾸기
	$("#btnUpdatePw").click(function(){
		console.log("버튼 클릭")
		if($("#userchkPw").val() =="") {
			$("#resultMsgChk").html("비밀번호 확인을 해주세요")
			$("#resultMsgChk").css("color","red")
			$("#resultMsgChk").focus()
			return false
		}
	})
	
	

	//버튼 클릭시 비밀번호 업데이트
	
	$("#btnUpdatePw").click(function(){
		$("#updatePwForm").submit()
		
	})
	
	
})
		
		
function validateUpdatePw(){
	
	let updatePw = document.getElementById("userPw").value
	
	if(!/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(updatePw)){
		console.log("비밀번호 유효성 검사 실패")
		document.getElementById("resultMsg").innerHTML="<span style='color:red;'> 비밀번호는 영문대소문자,숫자,특수문자를 모두 포함 8자 이상이어야 합니다.</span>"
		return false;
	}else {
		console.log("비밀번호 확인")
		document.getElementById("resultMsg").innerHTML="<span style='color:green;'> 사용가능한 비밀번호 입니다.</span>"
		return true;
	}
}	
	
function validateCkh(){
	let updatePw = document.getElementById("userPw").value
	let chkUpdatePw = document.getElementById("userchkPw").value
	
	//비밀번호 입력 확인
	if(updatePw != chkUpdatePw ){
		console.log("비밀번호 불일치")
		document.getElementById("resultMsgChk").innerHTML="<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>"
		return false;
	}else {
		console.log("비밀번호 일치")
		document.getElementById("resultMsgChk").innerHTML="<span style='color:green;'>비밀번호 확인 완료</span>"
		return true;
	}
}	
	
	


</script>


<style type="text/css">

#newPw{
	width: 500px;
	margin: 0 auto;


}

</style>

<body>

<div id="newPw">

	<h1>비밀번호 재설정</h1>
	<form action="/login/updatePw" method="post" id="updatePwForm">
	<div id="updatePw">
		<label for="userPw">비밀번호 
			<input type="text" name="userPw" id="userPw">
		</label>
	</div>
	
	<div id="resultMsg"></div>	

	<div id="chkUpdatePw">
		<label for="chkPw"> 비밀번호 확인
			<input type="text" name="userchkPw" id="userchkPw">
		</label>
	</div>

	<div id="resultMsgChk"></div>	
	<button type="button" id="btnUpdatePw">비밀번호 설정하기</button>
	</form>
</div>


</body>
</html>