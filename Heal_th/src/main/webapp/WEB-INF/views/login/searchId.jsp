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
					$("#emailSearch").css("visibility","visible");
					$("#smsSearch").css("visibility","hidden");
				}else if(ckhValue =='sms'){
					console.log("이메일인증하기 보이기")
					$("#smsSearch").css("visibility","visible");
					$("#emailSearch").css("visibility","hidden");
				}
			})
			
				
		
			

			
			//resultMsg 초기화 
			$("#userName").focus(function(){
				$("#resultMsg").html("")
				$("#resultMsg").css("color","black")
				
			})
			$("#userEmail").focus(function(){
				$("#resultMsg").html("")
				$("#resultMsg").css("color","black")
			})
			$("#emailCode").focus(function(){
				$("#resultMsg").html("")
				$("#resultMsg").css("color","black")
			})
			$("#userNameBySms").focus(function(){
				$("#resultMsg").html("")
				$("#resultMsg").css("color","black")
			})
			$("#userPhone").focus(function(){
				$("#resultMsg").html("")
				$("#resultMsg").css("color","black")
			})
			$("#smsCode").focus(function(){
				$("#resultMsg").html("")
				$("#resultMsg").css("color","black")
			})
			
	$("#btnsearchId").click(function(){
			console.log("이메일 인증받기 버튼 클릭")
		$.ajax({
			
			type:"post"
			,url:"/login/searchId"
			,data :{
				userName : $("#userName").val()
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
					$("#resultMsg").html("일치하는 회원정보가 없습니다. 아이디 또는 이메일을 확인해주세요")
					$("#resultMsg").css("color","red")
					
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
				if(res != "false") {
					console.log("아이디 찾기 성공")
					$("#searchId").css("display","none")
					$("#btnCancel").css("display","none")
					$("#resultMsg").html("회원님의 아이디는"+res+"입니다.")
					$("#toLogin").show()
				}else  {
					console.log("이메일 인증 실패")
					$("#resultMsg").html("<p>인증 실패. 인증번호를 한번 더 확인해주세요</p>")
					$("#resultMsg").css("color","red")
				}
				
			}
			,error : function(){
				console.log("실패다 실패야...")
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
					$("#smsCode").attr("disabled",false)
					$("#smsCode").focus()
				}else {
					console.log("회원 없음")
					$("#resultMsg").html("일치하는 회원정보가 없습니다. 아이디 또는 전화번호를 확인해주세요")
					$("#resultMsg").css("color","red")
					
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
					$("#searchId").css("display","none")
					$("#btnCancel").css("display","none")
					$("#resultMsg").html("회원님의 아이디는"+res+"입니다.")
					$("#toLogin").show()
				}else  {
					console.log("이메일 인증 실패")
					$("#resultMsg").html("<p>인증 실패. 인증번호를 한번 더 확인해주세요</p>")
					$("#resultMsg").css("color","red")
				}
				
			}
			,error : function(){
				console.log("실패다 실패야...")
			}
		}); //문자인증 완료 
				
	})
})


function cancel(){
	console.log("취소하기")
	history.go(-1)
}




</script>

<style type="text/css">

#search{
	width: 500px;
	margin: 0 auto;

}

</style>

<body>
	<div id="search">
		<div id="searchId">
		<h1 id="title">아이디찾기</h1>
	
				<input type="radio" name="searchIdBy" value="email" id="searchIdByEmail" >이메일로 인증하기
				<div id="emailSearch" style="visibility:hidden;" >
						<div class="usernameArea" >
							<label for="userName">이름
								<input type="text" name="userName" id="userName" placeholder="이름을 입력하세요">
							</label>
						</div>
						
						<div id="email">
							<label for="userEmail">이메일주소
								<input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력하세요">
							</label>
							<button type="button" id="btnsearchId">인증번호받기</button>
						</div>
						
						<div id="confirmEmail">
							<label for="emailCode">인증번호
								<input type="text" name="emailCode" id="emailCode" placeholder="인증번호를 입력하세요" disabled>
							</label>
							<button type="button" id="chkemailCode">인증번호 확인</button>
						</div>
				</div>
				
				<input type="radio" name="searchIdBy" value="sms" id="searchIdBySms" >문자로 인증하기
				<div id="smsSearch" style="visibility:hidden;" >
						<div class="usernameArea" >
							<label for="userName">이름
								<input type="text" name="userNameBySms" id="userNameBySms" placeholder="이름을 입력하세요">
							</label>
						</div>
						
						<div id="sms">
							<label for="userPhone">전화번호
								<input type="text" name="userPhone" id="userPhone" placeholder="전화번호를 입력하세요">
							</label>
							<button type="button" id="btngetSmsCode">인증번호받기</button>
						</div>
						
						<div id="confirmSms">
							<label for="smsCode">인증번호
								<input type="text" name="smsCode" id="smsCode" placeholder="인증번호를 입력하세요" disabled>
							</label>
							<button type="button" id="chksmsCode">인증번호 확인</button>
							
						</div>
				</div>
		
	</div>
	
		<div id="result">
			<div id="resultMsg"></div>
			<button type="button" id ="toLogin" onclick="location.href='/login/login'" style="display:none;">로그인하기</button>
		
		</div>
		<div id="btnCancel">
			<button type="button" onclick="cancel()">뒤로가기</button>
		</div>
</div>

</body>
</html>