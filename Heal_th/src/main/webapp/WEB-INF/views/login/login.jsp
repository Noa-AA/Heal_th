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
	

})
	


</script>


<style type="text/css">
body{
	padding-top: 0;
}
#loginForm{
	width: 1400px;
	margin: 0 auto;
	text-align: center;
	padding-top: 150px;
}
#boxArea{
	height: 526px;
    width: 457px;
    position: absolute;
    left: 600px;
}
}

button{
	border:  none;
}




</style>
<body>

<%//쿠키값 얻기
	Cookie [] cookie = request.getCookies();
		String savedId = "";
	for(Cookie cookieId : cookie) {
		 if(cookieId.getName().equals("userId")) {
			 savedId = cookieId.getValue();
		 }
	} 
%>


<div id="loginForm">
	<div id="boxArea">
	
		<h1 class="letterLogin">로그인</h1>
			<div id="chkLogin"></div>
			
			<form action="/login/login" method="post">
				
			
				<div id="id">
					아이디
					<input type="text" name="userId" placeholder="아이디를 입력하세요" id="userId" value="<%=savedId%>">
				</div>
				
				<div id="pw">
					비밀번호 
					<input type="password" name="userPw" placeholder="비밀번호를 입력하세요" id="userPw">
				</div>
				
				<c:if test="${isLogin == false}">
					<div id="resultLogin">
						<span style="color:red;" id="resultMsg">아이디 또는 비밀번호를 다시 한번 확인해주세요</span>
					</div>
				</c:if>
				
				<div id="isSave">
					<input type="checkbox" id="saveId" name ="saveId" value="saveId">아이디 저장
				</div>
		
				<button id="btnLogin" >로그인</button>	
			</form>
			
			
			
			<div id="joina">
				<a href="/login/join">회원가입</a>
			</div>
			
			<!-- 네이버 로그인 버튼 노출 영역 -->
			<div id="naverLogin">
				<a id="btnNaver" href="${naverURL}"><img src="<%=request.getContextPath() %>/resources/img/login/btnG_완성형.png" width="223"></a>
			
			</div>
			
			<!-- 카카오 로그인 버튼 노출 영역 -->
			<div id="kakoLogin">
				<a id="btnKakao" href="${kakaoURL}"><img src="<%=request.getContextPath() %>/resources/img/login/kakao_login_medium_narrow.png" width="223"></a>
			</div>
			
			<div id="searchId">
				<a href="/login/searchId">아이디찾기</a>
			</div>
			
			<div id="searchPw">
				<a href="/login/searchPw">비밀번호 찾기</a>
			
			</div>
	</div>
	
</div>
</body>


</html>