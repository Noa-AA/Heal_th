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
		$("#nameAlert").html("")
	})
	$("#userId").focus(function(){
		$("#checkIdResult").html("")
	})
	$("#userBirth").focus(function(){
		$("#birthAlert").html("")
	})
	$("#userPhone").focus(function(){
		$("#userchkAlert").html("")
	})
	$("#pwSmsCode").focus(function(){
		$("#searchPwResult").html("")
	})
	
	
	//인증번호 받기 
	$("#btnSearchPw").click(function(){
		 console.log("인증번호 받기 버튼 클릭")
			if($("#userPhone").val()==null || $("#userPhone").val()==""){
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
	
 	$("#btn_code").click(function(){
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
					 $("#searchPwResult").html("인증성공")
					$("#searchPwResult").css("color","green")
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
	 
	 
	 //클릭시 비밀번호 찾기
	 $("#btnGotoSearchPw").click(function(){
		console.log("비밀번호 찾기 클릭") 
		
		if(validate()){
			location.href="/login/makeNewPw"
			
			
		}
	 })


})//ready


	
function validate(){
	//이름이 빈칸일 때 
	if(document.getElementById("userName").value =="") {
		console.log("이름입력 알림")
		document.getElementById("nameAlert").innerHTML="<span style='color:red;'>* 이름을 입력해주세요</span>"
		return false;
	} 
	
	
	//아이디가 빈칸일 때 
	var testId = document.getElementById("userId").value
	if(testId =="") {
		console.log("아이디입력 알림")
		document.getElementById("checkIdResult").innerHTML="<span style='color:red;'>* 아이디를 입력해주세요</span>"
			return false;
	}
	//연락처가 빈칸일 때 
	if(document.getElementById("userPhone").value =="") {
		console.log("연락처입력 알림")
		document.getElementById("userchkAlert").innerHTML="<span style='color:red;'>* 연락처를 입력하고 본인인증을 해주세요</span>"
			return false;
	}

	//본인인증번호가 안되었을 때 ->
// 	if(document.getElementById("code").value =="") {
// 		console.log("본인인증입력 알림")
// 		document.getElementById("result_code").innerHTML="<span style='color:red;'>* 본인인증을 해주세요</span>"
//       return false; 		    	
//			 }	

	return true;
}


</script>



<style type="text/css">
#searchPwBody{
	
	padding-top: 0;
}

#searchPw {
	width: 542px;
    height: 820px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
 }
 
.inputInfo:focus{
	border-bottom-color:#7ca3f5; 
}

#boxArea{
	margin: 0px 60px;
    height: 800px;

}
#titleForHead{
	font-size: 30px;
}

.formTitle{
	font-size: 17px;
	color:gray;
    margin: 10px 0 0;
}
#title{
	padding-top: 60px;
    text-align: center;
}

#searchPwForm{
	margin-top: 35px;
}


.inputArea{
	margin: 0;
	position:relative;
	height:114px;
}
.formTitle{
	font-size: 17px;
	color:gray;
	 position: absolute;
    margin: 10px 0 0;
}

.inputInfo{
	width: 422px;
    height: 33px;
    margin-left: 0;
    outline: none;
    border: none;
    border-bottom: 2px solid lightgray;
    position:absolute;
    top:39px;
     font-size: 17px;
}
#btnSearchPw,#btn_code{
	width: 108px;
    height: 36px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:17px;
    border-radius: 8px;
}

#btnSearchPw:hover,#btn_code:hover{
	color: white;
    background-color: #7ca3f5;
    width: 108px;
    height: 36px;
    border-radius: 8px;
}
#userPhone,#pwSmsCode{
width: 316px;
}

#btnGetCode,#btn_code{
position: absolute;
 left: 316px;
 top: 37px;

}


.resMsg{
	position: absolute;
    top: 85px;
    margin: 7px 0 0;
}

#btnArea{
	position: absolute;
    height: 50px;
    left: 60px;
	margin: 30px 0 0 0;
}

#btnGotoSearchPw,#btnCancel{
	width: 190px;
    height: 47px;
      border-radius: 8px;
}

#btnGotoSearchPw{
	background-color: #7ca3f5;
	font-size: 17px;
	color:white;
}

#btnGotoSearchPw:hover,#btnCancel:hover{
	box-shadow: 5px 19px 12px #ddd;
}


#btnCancel{
	margin-left: 40px;
	font-size: 17px;
    color: #7ca3f5;
    background-color: transparent;
    border:2px solid #7ca3f5;
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
				<div id="nameAlert"  class="resMsg"></div>
			</div>
			
			<div id="id" class="inputArea">
				<label for="userId">
					<span class="formTitle id">아이디</span>
				</label>
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요" class="inputInfo">
				<div id="checkIdResult" class="resMsg"></div>
			</div>		
			
			<div id="birth" class="inputArea">				
				<label for="birth">
						<span class="formTitle birth">생년월일</span>
				</label>
				<input type="text" id="userBirth"name="userBirth" placeholder="생년월일 예)19930101" class="inputInfo">
				<div id="birthAlert" class="resMsg"></div>
			</div>
					
			
			<div id="phone" class="inputArea">
				<label for="userPhone">
					<span class="formTitle mobilePhone">연락처</span>
				</label>
				<input type="text" name="userPhone" id="userPhone"  class="inputInfo" placeholder="전화번호를 입력해주세요">
				<div id="btnGetCode">
					<button type="button" id="btnSearchPw"><span class="btnTitle btnsmsCodeChk">인증번호 받기</span></button>
				</div>
				<div id="userchkAlert" class="resMsg"></div>
				
			</div>
			
			
			<div id="pwCode" class="inputArea">
				<label for="pwSmsCode">
				<input type="text" name="pwSmsCode" id="pwSmsCode"  class="inputInfo"  placeholder="인증번호를 입력해주세요" disabled>
				</label>
				<div id="btnsmschk">
					<button type="button" id="btn_code"><span class="btnTitle btnsmsCodeChk">인증번호 확인</span></button>			
				</div>
				<div id="searchPwResult" class="resMsg"></div>
			</div>
			
			<div id="btnArea">
				<button type="button" id="btnGotoSearchPw" >비밀번호 찾기</button>
				<button type="button" id="btnCancel">취소하기</button>
			</div>
		</div>
	</div>			

</div>

</body>
<jsp:include page="../layout/footer.jsp"/>
</html>