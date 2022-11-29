<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <script type="text/javascript">
 
  $(document).ready(function(){

			  $("#btn_checkId").click(function(){
				
				  	console.log("checkId 클릭")
				
				  	$.ajax({
				  		
				  		type:"post"
				  		,url:"/login/checkId"
				  		,data:{
				  			userId : $("#userId").val()
				  			}
				  		,dataType:"json"
				  		,success:function(res){
// 				  			
				  			console.log(res)
				  			if(res ==0) {	
				  			$("#checkId").html("사용가능한 아이디입니다.")
				  			$("#checkId").css("color","green")
				  			
				  			} else {
				  				$("#checkId").html("사용할 수 없는  아이디입니다.")
				  				$("#checkId"). css("color","red")
				  			}
				  		}
				  		,error: function(){
				  			console.log("중복확인 실패")
				  			
				  		}
				  	})
			  })
			  
  })
  
 
 </script>
</head>


<body>


회원 가입

<div id="joinform">
	<form action="/login/join" method="post">
		<div id="name">		
		 	<label for="userName">이름</label> 
	 		<input type="text" name="userName" id="userName">
		</div>
	
		<div id="email">
			<label for="userEmail">이메일</label>
			<input type="text" name="userEmail" id="userEmail">
		</div>
		<div id="id">
			<label for="userId">아이디</label>
			<input type="text" name="userId" id="userId">
		</div>
		<div id="btn_checkId">
			<button type="button">중복확인</button>
		</div>
		<div id="checkId"></div>
	
		<div id="pw">
			<label for="userPw">비밀번호</label>
			<input type="text" name="userPw" id="userPw">
		</div>
		
		<div id="nick">
			<label for="userNick">닉네임</label>
			<input type="text" name="userNick" id="userNick">
		</div>
		<div id="phone">
			<label for="userPhone">연락처</label>
			<input type="text" name="userPhone" id="userPhone">
		</div>
		
	
		<div id="address">
			<label for="userAddress">주소</label>
			<input type="text" name="userAddress" id="userAddress">
		</div>
		
		
		<button id="joinbtn">가입 완료</button>
	
	</form>

</div>
</body>
</html>