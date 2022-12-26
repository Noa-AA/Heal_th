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
	$("#userBirth").focus(function(){
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
			console.log("전화번호 누락")
	 		$("#userchkAlert").html("전화번호로 입력해주세요")
	 		$("#userchkAlert").css("color","red")
	 		return false
	 	}else{
	 		$("#codeChk").css("display","block")
		 
		 $.ajax({
		
			 type:"post"
			 ,url:"/login/searchPw"
			 ,data:{
				 userName: $("#userName").val()
				 ,userId : $("#userId").val()
				 ,userPhone: $("#userPhone").val()
				 ,userBirth: $("#userBirth").val()
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
					 $("#searchPwResult").html("일치하는 회원정보가 없습니다.이름,아이디,생년월일,전화번호를 확인해주세요")
					 $("#searchPwResult").css("color","red")
				 }
			 }
			 ,eroor:function(){
				 console.log("오류입니다.")
				 alert("시스템 오류  다시 진행해주세요")
			 }
		 })
	 	}
		 
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
#searchPwBody{
	width: 1400px;
	margin: 0 auto;
	padding-top: 0;
}

#searchPw {
	width: 542px;
    height: 800px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
 }
 
 input:focus{
	border-bottom-color:#7ca3f5; 
}

#boxArea{
	margin: 0px 60px;
    height: 800px;

}

</style>

<body id="searchPwBody">

<div id="searchPw">
	<div id="boxArea">
		<div id="title">
			<span id="titleForHead">비밀번호 찾기</span>
		</div>
		<div id ="searchPwForm">
		
			<div id="name" class="inputArea">
			<label for="userName">
				<span class="formTitle name">이름</span>
			</label>
				<input type="text" name="userName" id="userName" class="inputInfo" placeholder="이름을 입력해주세요">
			</div>
			
			<div id="id" class="inputArea">
				<label for="userId">
					<span class="formTitle id">아이디</span>
				</label>
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요" class="inputInfo">
			</div>		
			
			<div id="birth" class="inputArea">				
				<label for="birth">
						<span class="formTitle birth">생년월일</span>
				</label>
				<input type="text" id="userBirth"name="userBirth" placeholder="생년월일 예)19930101" class="inputInfo">
			</div>
					
			
			<div id="phone" class="inputArea">
				<label for="userPhone">
					<span class="formTitle mobilePhone">연락처</span>
				</label>
				<input type="text" name="userPhone" id="userPhone"  class="inputInfo" placeholder="전화번호를 입력해주세요">
				<div id="btnGetCode" class="inputArea">
					<button type="button" id="btnSearchPw"><span class="btnTitle btnsmsCodeChk">인증번호 받기</span></button>
				</div>
				<div id="userchkAlert" class="resMsg"></div>
				
			</div>
			
			
			<div id="pwCode" class="inputArea">
				<label for="pwSmsCode">
				<input type="text" name="pwSmsCode" id="pwSmsCode" placeholder="인증번호를 입력해주세요" disabled>
				</label>
				<div id="btnsmschk">
					<button type="button" id="btn_code"><span class="btnTitle btnsmsCodeChk">인증번호 확인</span></button>			
				</div>
				<div id="searchPwResult"></div>
			</div>
			
			<div id="btnArea">
				<button type="button" id="btnCancel">취소하기</button>
				<button type="button" id="btnGotoSearchId" onclick="location.href='/login/searchId'">아이디 찾기</button>
			</div>
		</div>
	</div>			

</div>

</body>
</html>