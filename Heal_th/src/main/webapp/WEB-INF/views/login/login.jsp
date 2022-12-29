<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){

	
	//아이디 저장 체크시 처리
	if($("#userId").val() != ""){
		$("#saveId").attr("checked",true)
	}
	 //아이디 입력창에 포커스 주기
    $("input").eq(0).focus()
	
	
	// 로그인 재시도시 input 박스 초기화
	   //input박스 초기화
	$("#userId").focus(function(){
		    $("#resultMsg").html("");
	})
	
	$("#userPw").focus(function(){
		    $("#resultMsg").html("");
	})
	
	
	//버튼 클릭시 제출
	$("#btnLogin").click(function(){
		$("#loginForm").submit()
	})
	
	//엔터키 눌러서 제출
	$("#userPw").on('keypress',function(e){
		if(e.keyCode == '13'){
			$("#btnLogin").click();
		}
	})

})
	


</script>


<style type="text/css">
#loginBody{
	padding-top: 0;
}
#loginPage{
	width: 1400px;
	margin: 0 auto;
	text-align: center;
	padding-top: 100px;
}
#boxArea{
    height: 670px;
    width: 490px;
    position: relative;
    left: 490px;
    background-color: white;
    box-shadow: 0px 5px 25px 5px lightgrey;
    border-radius: 12px;
}

button{
	border:  none;
}

#title{
padding-top: 20px;
}
#loginArea{
	margin-top: 41px;
    height: 192px;
    position: relative;
    margin: 41px 21px 0;
}

form{
	height: 192px;

}

#id,#pw{
	height:66px;
	outline: none;
	width: 449px;
}

#pw{
	position: relative;
    top: 20px;
    width: 446px;
    left: 0px;
}



#isSave{
	 position: absolute;
    left: 0px;
    width: 113px;
    top: 178px;
    margin-top: 17px;
    height: 25px;
}


.formName{
	font-size: 17px;
	color: gray;
}

.saveId{
	font-size: 17px;
}

#userId,#userPw{

    border-top: 0;
    border-left: 0;
    border-right: 0;
    width: 400px;
    margin-left: 20px;
    font-size:17px;
    background-color: white;
}

#userId{
    position: absolute;
    top: 35px;
    width: 444px;
    left: -17px;
    height: 30px;
    
}
input{
	outline: none;
}

input::placeholder{
	font-size: 15px;

}
#idLabel{
	margin-right: 15px;
    position: absolute;
    top: 5px;
    left: 8px;
    color: gray;

}
#pwLabel{
     position: absolute;
    width: 67px;
    left: 4px;

}

#userPw{
      position: absolute;
    top: 33px;
    width: 444px;
    left: -17px;
    height: 30px;
    
}
#btnArea,#socialLogin{

	margin-top:40px;
}

#searchArea{
    width: 201px;
    position: relative;
    top: 2px;
    left: 267px;
    height: 28px;
}

#searchId{
    float: left;
    position: absolute;
    left: -3px;
    padding: 0 10px 0px 10px;
}
#searchPw{
    position: absolute;
    left: 91px;
    padding-left: 10px;
    border-left: 1px solid gray;

}

#btnArea{
	 position: absolute;
    height: 51px;
    top: 390px;
    width: 491px;
}

#loginExe,#joinExe{
 	position: absolute;
    width: 213px;
    height: 43px;

}

#resultLogin{
position: absolute;
    top: 158px;
     padding-left: 5px;   
    
}

.btn{
    width: 213px;
    height: 41px;

}

.login{
	background:#7ca3f5;
    border: none;
}
.join{
    height: 41px;
    border: 2px solid #7ca3f5;
    background: transparent;

}

#loginExe{
	left: 23px;
}

#joinExe{
	    left: 258px;
}
#socialLogin{
	position: relative;
    top: 65px;
    height: 123px;

}

#naverLogin{
	position: absolute;
    left: 25px;
}

#socialLogin img{
    width: 443px;
    height: 55px;
}
#kakaoLogin{
	position: absolute;
    top: 65px;
    left: 25px;
}

.btnTitle{
	 font-size: 20px;
    font-weight: 600;
}
.title_login{
	color:white;
}
.title_join{
	color: #7ca3f5;
}
</style>
<body id="loginBody">

<%//쿠키값 얻기
	Cookie [] cookie = request.getCookies();
		String savedId = "";
	for(Cookie cookieId : cookie) {
		 if(cookieId.getName().equals("userId")) {
			 savedId = cookieId.getValue();
		 }
	} 
%>


<div id="loginPage">
	<div id="boxArea">
	
		<div id="title">
			<img id="loginImg" src="/resources/img/login/HealLogo.png">		
		</div>
		
			<div id="loginArea">
			
			<form action="/login/login" method="post" id="loginForm">
				
			
				<div id="id">
					<label for="userId"  id="idLabel">
						<span class="formName">아이디</span>
					</label>
					<input type="text" name="userId" placeholder="아이디를 입력하세요" id="userId" value="<%=savedId%>">
									
				</div>
				
				<div id="pw">
					<label for="userPw" id="pwLabel">
						<span class="formName">비밀번호 </span>
					</label>
					<input type="password" name="userPw" placeholder="비밀번호를 입력하세요" id="userPw">
				</div>
				
				<c:if test="${isLogin == false}">
					<div id="resultLogin">
						<span style="color:red;" id="resultMsg">아이디 또는 비밀번호를 다시 한번 확인해주세요</span>
					</div>
				</c:if>
				
				<div id="isSave">
					<input type="checkbox" id="saveId" name ="saveId" value="saveId"><span class="formName saveId" style="padding-left: 6px;">아이디 저장</span>
				</div>
		
			</form>
		</div>
				
			<div id="searchArea">
				<div id="searchId">
					<a href="/login/searchId"><span class="formName">아이디찾기</span></a>
				</div>
				
				<div id="searchPw">
					<a href="/login/searchPw"><span class="formName">비밀번호 찾기</span></a>
				</div>
			</div>


			<div id="btnArea">
				<div id="loginExe">
					<button class="btn login" type="button" id="btnLogin"><span class="btnTitle title_login">로그인</span></button>	
				</div>
			
				<div id="joinExe">
					<button class="btn join" onclick="location.href='/login/join'"><span class="btnTitle title_join">회원가입</span></button>
				</div>
			</div>
			
			
			<div id="socialLogin">			<!-- 네이버 로그인 버튼 노출 영역 -->
				<div id="naverLogin">
					<a id="btnNaver" href="${naverURL}"><img src="<%=request.getContextPath() %>/resources/img/login/buttonNaverLogin.png" width="223"></a>
				
				</div>
				
				<!-- 카카오 로그인 버튼 노출 영역 -->
				<div id="kakaoLogin">
					<a id="btnKakao" href="${kakaoURL}"><img src="<%=request.getContextPath() %>/resources/img/login/kakao_login_medium_wide.png" width="223"></a>
				</div>
				
			</div>

	</div>
	
</div>
</body>
<jsp:include page="../layout/footer.jsp"/>

</html>