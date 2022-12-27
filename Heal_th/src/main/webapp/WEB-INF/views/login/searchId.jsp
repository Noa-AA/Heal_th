<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
			//버튼 클릭에 따라 아이디 찾기 폼 보이기 
			$('input[type="radio"]').click(function(){
				var ckhValue =$("input[name='searchIdBy']:checked").val();
					console.log("radio 클릭")
					console.log(ckhValue)
					
				if(ckhValue =='email'){
					console.log("이메일인증하기 보이기")
					$("#emailSearch").css("display","block");
					$("#smsSearch").css("display","none");
				}else if(ckhValue =='sms'){
					console.log("문자인증하기 보이기")
					$("#smsSearch").css("display","block");
					$("#emailSearch").css("display","none");
				}
			})
			
				
		
			

			
			//resultMsg 초기화 
			$("#userNameByEmail").focus(function(){
				$("#nameAlertForEmail").html("")
			})
			$("#userEmail").focus(function(){
				$("#emailAlert").html("")
			})
			$("#emailCode").focus(function(){
				$("#searchIdbyEmailResult").html("")
			})
			$("#userNameBySms").focus(function(){
				$("#resultMsg").html("")
			})
			$("#userPhone").focus(function(){
				$("#smsAlert").html("")
			})
			$("#smsCode").focus(function(){
				$("#searchIdbySmsResult").html("")
			})
			
			//이메일 인증하기 시작
	$("#btnsearchId").click(function(){
			console.log("이메일 인증받기 버튼 클릭")
		$.ajax({
			
			type:"post"
			,url:"/login/searchId"
			,data :{
				userName : $("#userNameByEmail").val()
				,userEmail: $("#userEmail").val()				
			}
			,dataType:"json"
			,success:function(res){
				console.log(res)
				console.log("이메일 번호 보내기 ")
				if(res == true) {
					console.log("회원 있음")
					$("#emailCode").attr("disabled",false)
					$("#emailCode").focus()
				}else {
					console.log("회원 없음")
					$("#emailAlert").html("일치하는 회원정보가 없습니다. 아이디 또는 이메일을 확인해주세요")
					$("#emailAlert").css("color","red")
					
				}
				
			}
			,error : function(){
				console.log("오류 입니다.")
				alert("시스템 오류  다시 진행해주세요")
			}
		}); //이메일 보내기 요청 완료 
			
	})//인증하기 버튼 클릭 
	
	
	$("#chkemailCode").click(function(){
				console.log("인증번호 확인하기 버튼 클릭 ")
			$.ajax({
			type:"post"
			,url:"/login/codeIdChk"
			,data :{
				emailCode : $("#emailCode").val()
			}
			,dataType:"text"
			,success:function(res){
				console.log(res)
				console.log("이메일 인증하기 ")
				if(res) {
					console.log("아이디 찾기 성공")
					$("#searchIdbyEmailResult").html("인증 성공")
					$("#searchIdbyEmailResult").css("color","green")
// 					$("#searchId").css("display","none")
// 					$("#btnCancel").css("display","none")
// 					$("#resultMsg").html("회원님의 아이디는"+res+"입니다.")
// 					$("#toLogin").show()
				}else  {
					console.log("이메일 인증 실패")
					$("#searchIdbyEmailResult").html("<p>인증 실패. 인증번호를 한번 더 확인해주세요</p>")
					$("#searchIdbyEmailResult").css("color","red")
				}
				
			}
			,error : function(){
				console.log("오류")
				alert("시스템오류 다시 진행해주세요")
			}
		}); //이메일 인증 완료 
				
				
	})
	
			//문자로 인증번호 받기 클릭
			$("#btngetSmsCode").click(function(){
			console.log("전화번호 인증받기 버튼 클릭")
		$.ajax({
			
			type:"post"
			,url:"/login/searchIdBySms"
			,data :{
				userName : $("#userNameBySms").val()
				,userPhone: $("#userPhone").val()				
			}
			,dataType:"json"
			,success:function(res){
				console.log(res)
				console.log("문자 번호 보내기 ")
				if(res == true) {
					console.log("회원 있음")
					$("#smsAlert").attr("disabled",false)
					$("#smsAlert").focus()
				}else {
					console.log("회원 없음")
					$("#smsAlert").html("일치하는 회원정보가 없습니다. 아이디 또는 전화번호를 확인해주세요")
					$("#smsAlert").css("color","red")
					
				}
				
			}
			,error : function(){
				
			}
		}); //이메일 보내기 요청 완료 
			
	})//인증하기 버튼 클릭 
	

	$("#chksmsCode").click(function(){
				console.log("인증번호(문자) 확인하기 버튼 클릭 ")
				
				$.ajax({
			type:"post"
			,url:"/login/checkSmsCode"
			,data :{
				smsCode : $("#smsCode").val()
			}
			,dataType:"text"
			,success:function(res){
				console.log(res)
				console.log("문자 인증하기 ")
				if(res != "false") {
					console.log("아이디 찾기 성공")
					$("#searchIdbySmsResult").html("인증 성공")
					$("#searchIdbySmsResult").css("color","green")
// 					$("#searchId").css("display","none")
// 					$("#btnCancel").css("display","none")
// 					$("#resultMsg").html("회원님의 아이디는"+res+"입니다.")
// 					$("#toLogin").show()
				}else  {
					console.log("이메일 인증 실패")
					$("#searchIdbySmsResult").html("<p>인증 실패. 인증번호를 한번 더 확인해주세요</p>")
					$("#searchIdbySmsResult").css("color","red")
				}
				
			}
			,error : function(){
				console.log("실패다 실패야...")
			}
		}); //문자인증 완료 
		
				
	})
		//폼 제출 하기 
		$("#btnfindId").click(function(){
			
			if(validateEmail()){
				console.log("이메일  인증으로 아이디 찾기")
// 				$("#searchIdByEmailForm").submit();
				
			}else if(validateSms()){
				console.log("전화번호 인증으로 아이디 찾기")
				$("#searchIdBySmsForm").submit()
			}
			
		})
				
	
	

	
})

	function validateEmail(){
				
				//이름이 빈칸일 때 
				if(document.getElementById("userNameByEmail").value =="") {
					console.log("이름입력 알림")
					document.getElementById("nameAlertForEmail").innerHTML="<span style='color:red;'>* 이름을 입력해주세요</span>"
					return false;
				} 
				
				//이메일 빈칸일 때 
				var testId = document.getElementById("userEmail").value
				if(testId =="") {
					console.log("이메일입력 알림")
					document.getElementById("emailAlert").innerHTML="<span style='color:red;'>* 이메일을 입력해주세요</span>"
						return false;
				}
				//인증번호 입력칸이 빈칸일 때  
				if(document.getElementById("emailCode").value =="") {
					console.log("이메일 인증 번호입력 알림")
					document.getElementById("searchIdbyEmailResult").innerHTML="<span style='color:red;'>* 인증번호를 입력해주세요</span>"
						return false;
				}

			
		return true;
				
	}
	
			
	function validateSms(){
		
		//이름이 빈칸일 때 
		if(document.getElementById("userNameBySms").value =="") {
			console.log("이름입력 알림")
			document.getElementById("nameAlertForSms").innerHTML="<span style='color:red;'>* 이름을 입력해주세요</span>"
			return false;
		} 
		
		//이메일 빈칸일 때 
		var testId = document.getElementById("userPhone").value
		if(testId =="") {
			console.log("전화번호입력 알림")
			document.getElementById("smsAlert").innerHTML="<span style='color:red;'>* 전화번호를 입력해주세요</span>"
				return false;
		}
		//인증번호 입력칸이 빈칸일 때  
		if(document.getElementById("smsCode").value =="") {
			console.log("문자인증 입력 알림")
			document.getElementById("searchIdbySmsResult").innerHTML="<span style='color:red;'>* 인증번호를 입력해주세요</span>"
				return false;
		}
		
		return true;
	}
function cancel(){
	console.log("취소하기")
	history.go(-1)
}




</script>

<style type="text/css">
#body{
	padding-top:0;
}
#searchId{
	width: 542px;
    height: 663px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;

}
#searchIdForm{
    margin-top: 40px;
}
.inputInfo:focus{
	border-bottom-color:#7ca3f5; 
}
#boxArea{
	margin: 0px 60px;
    height: 663px;

}
#title{
	padding-top: 60px;
    text-align: center;
}
#titleForHead{
	font-size: 30px;
    font-weight: 600;
    color: gray;
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

#userEmail,#emailCode,#userPhone,#smsCode{
	width: 315px;
}
#btnCancel,#btnfindId{
	width: 190px;
    height: 47px;
      border-radius: 8px;
	background-color: #7ca3f5;
	font-size: 17px;
	color:white;

}
.selectForm{
	font-size: 17px;
	color:gray;
}
.btnCode{
	width: 108px;
    height: 36px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:17px;
    border-radius: 8px;
}

#btnGetCode,#btnEmailchk,#getsmsCode,#btnSmschk{
	position: absolute;
    top: 37px;
    left: 315px;

}
#btnArea{
position: absolute;
    height: 50px;
    left: 60px;
	margin: 30px 0 0 0;
}
</style>

<body id="body">
	<div id="searchId">
		<div id="boxArea">
		
			<div id="title">
				<span id="titleForHead">아이디 찾기</span>
			</div>
			
			<div id="searchIdForm">
			
				<div id="emailArea">
					<div id="selectEmail">
						<input type="radio" name="searchIdBy" value="email" id="searchIdByEmail" ><span class="selectForm">이메일로 인증하기</span>
					</div>
						<div id="emailSearch" style="display : none;" >
								<form action="/login/searchIdResult" method="post" id="searchIdByEmailForm">
									<div id="userNameForEmail" class="inputArea" >
										<label for="userName">
											<span class="formTitle name">이름</span>
										</label>
											<input type="text" name="userName" id="userNameByEmail" class="inputInfo" placeholder="이름을 입력하세요">
										<div id="nameAlertForEmail"  class="resMsg"></div>
									</div>
									
									<div id="email" class="inputArea" >
										<label for="userEmail">
											<span class="formTitle name">이메일</span>
										</label>
										<input type="text" name="userEmail" id="userEmail" class="inputInfo" placeholder="이메일을 입력하세요">
										
										<div id="btnGetCode">
											<button type="button" id="btnsearchId" class="btnCode"> 인증번호 받기</button>
										</div>
										<div id="emailAlert"  class="resMsg"></div>
									</div>
									
									<div id="confirmEmail" class="inputArea">
										<label for="emailCode">
											<span class="formTitle name">인증번호</span>
										</label>
											<input type="text" name="emailCode" id="emailCode" class="inputInfo" placeholder="인증번호를 입력하세요" disabled>
										
										<div id="btnEmailchk">
											<button type="button" id="chkemailCode" class="btnCode">인증번호 확인</button>
										</div>	
										
										<div id="searchIdbyEmailResult" class="resMsg"></div>					
									</div>
								</form>
						</div>
				</div>
				<div id="smsArea">
					<div id="selectSms">
						<input type="radio" name="searchIdBy" value="sms" id="searchIdBySms" ><span class="selectForm">문자로 인증하기</span>
					</div>	
					
					<div id="smsSearch" style="display:none;" >
						<form action="/login/searchIdResult" method="post" id="searchIdBySmsForm">
							<div id="userNameForEmail" class="inputArea" >
								<label for="userName">
									<span class="formTitle name">이름</span>
								</label>
								<input type="text" name="userName" id="userNameBySms" class="inputInfo" placeholder="이름을 입력하세요">
								<div id="nameAlertForSms"  class="resMsg"></div>
							</div>
								
							<div id="sms" class="inputArea">
								<label for="userPhone">
									<span class="formTitle name">전화번호</span>
								</label>
									<input type="text" name="userPhone" id="userPhone" class="inputInfo" placeholder="전화번호를 입력하세요">
									
									<div id="getsmsCode">
										<button type="button" id="btngetSmsCode" class="btnCode">인증번호받기</button>
									</div>
									<div id="smsAlert"  class="resMsg"></div>
							</div>
								
							<div id="confirmSms" class="inputArea" >
								<label for="smsCode">
									<span class="formTitle name">인증번호</span>
								</label>
									<input type="text" name="smsCode" id="smsCode" class="inputInfo" placeholder="인증번호를 입력하세요" disabled>
								
								<div id="btnSmschk">
									<button type="button" id="chksmsCode" class="btnCode">인증번호 확인</button>
								</div>
								<div id="searchIdbySmsResult" class="resMsg"></div>			
							</div>
						</form>
					</div>
				</div>	
					
		</div>
		
		<div id="btnArea">
			<button type="button" id="btnfindId" >아이디 찾기</button>
			<button type="button" id="btnCancel" onclick="cancel()">취소하기</button>
		</div>
		
	
<!-- 		<div id="result"> -->
<!-- 			<div id="resultMsg"></div> -->
<!-- 			<div id="btnToLogin"> -->
<!-- 				<button type="button" id ="toLogin" onclick="location.href='/login/login'" style="display:none;">로그인하기</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
	
	</div>
</div>

</body>
</html>