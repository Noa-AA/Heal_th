<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./layout/adminheader.jsp" %>

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
#admingBody{
padding-top: 0;

}
#adminLogin{
	width: 1400px;
	margin: 0 auto;
	text-align: center;
	padding-top: 100px;
	}

#boxArea{
	height: 417px;
    width: 490px;
    position: relative;
    left: 490px;
    background-color: white;
    padding: 20px 30px;
    border: 2px solid #2274B3;
    border-radius: 13px;
}
.formName{
	font-size: 17px;
	color: gray;
}
button{
	border:  none;
}
#btnAdminLogin{
  	width: 213px;
    height: 41px;

}
#title{
padding-top: 20px;
}

.titleForHead{
	font-size: 30px;
    font-weight: 600;
    color: gray;
}

#adminLoginForm{
	margin-top:40px;
}

#adminId,#adminPw{
	margin-top: 20px;
}

#btn{
	margin-top: 30px;
}
#id,#pw{
	position:relative;
}

#pw{
	margin-top:30px;
}
.formName{

	position: absolute;
    top: -6px;
    padding-left: 3px;
}
#btnAdminLogin{
		width: 190px;
    height: 47px;
      border-radius: 8px;
	background-color: transparent;
	 border:2px solid #2274B3;
	font-size: 17px;
	color:#2274B3;
	
}
#btnAdminLogin:hover{
	color:white;
	background-color: #2274B3;
}

#adminId,#adminPw{
    width: 422px;
    height: 33px;
    margin-left: 0;
    outline: none;
    border: none;
    border-bottom: 2px solid lightgray;
    font-size: 17px;

}
#resultAdminLogin{
	margin-top: 10px;
}
</style>

<body id="adminBody">

<div id="adminLogin">
	<div id="boxArea">
		<div id="title">
			<span class="titleForHead">로그인</span>
		</div>
		
		<div id="formArea">
			<form action="/admin" method="post" id="adminLoginForm">
			
				<div id="id">
					<label for="adminId">
						<span class="formName adminId">아이디</span>
					</label>
						<input id="adminId" name="adminId" placeholder="관리자 아이디를 입력하세요">
				</div>
				<div id="pw">
					<label for="adminPw">
						<span class="formName">비밀번호 </span>						
					</label>
					<input id="adminPw" name="adminPw" placeholder="관리자 비밀번호를 입력하세요">
				</div>
			
				<c:if test="${isAdminLogin == false}">
				
					<div id="resultAdminLogin">
						<span style="color:red;" id="result">아이디 또는 비밀번호를 다시 한번 확인해주세요</span>
					</div>
				</c:if>
			
				<div id="btn">
					<button id="btnAdminLogin"> 로그인</button>
				</div>
			</form>
			
		
		
		</div>
	</div>


</div>

</body>
</html>