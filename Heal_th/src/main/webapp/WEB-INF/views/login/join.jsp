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
		 	<label for="userName">이름
	 		<input type="text" name="userName" id="userName">
	 		</label> 
		</div>
	
		<div id="email">
			<label for="userEmail">이메일
			<input type="text" name="userEmail" id="userEmail">
			</label>
		</div>
		<div id="id">
			<label for="userId">아이디
			<input type="text" name="userId" id="userId">
			</label>
		</div>
		
		<div id="btn_checkId">
			<button type="button">중복확인</button>
		</div>
		
		<div id="checkId"></div>
	
		<div id="pw">
			<label for="userPw">비밀번호
			<input type="text" name="userPw" id="userPw">
			</label>
		</div>
		
		<div id="nick">
			<label for="userNick">닉네임
			<input type="text" name="userNick" id="userNick">
			</label>
		</div>
		<div id="phone">
			<label for="userPhone">연락처
			<input type="text" name="userPhone" id="userPhone">
			</label>
		</div>
		
		<div id="gender">
			<label for="userGender">성별			
			<input type="radio" name="userGender" value="male">남성
			<input type="radio" name="userGender" value="female">여성
			</label>
			
		<div id="birth">
			<label for="birth">생년월일
				<input type="text" name="userBirth" placeholder="생년월일 예)19930101">
			</label>
		</div>
		<div id="job">
			<label for="userJob">직업</label>
			<select name="userJob">
				<option value="staff">회사원</option>
				<option value="teacher">교사</option>
				<option value="publicOfficial">공무원</option>
				<option value="trainer">트레이너</option>
				<option value="business">자영업</option>
				<option value="student">학생</option>
				<option value="etc">기타</option>
			</select>
				
		</div>
		
		
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