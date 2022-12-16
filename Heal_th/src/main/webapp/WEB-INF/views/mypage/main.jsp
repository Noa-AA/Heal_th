<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<style type="text/css">
body{
	padding-top:0;
}
#mypage{
	width: 1200px;
	margin: 0 auto;
}
.infoTitle{
	font-size: 20px;
	margin: 10px 0;
}

#profileArea{

	width: 200px;
    position: fixed;
    left: 200px;
}

#pIcon{
	width:100px;
}

#manageInfo{
	margin-top: 29px;	
}

#intro{
	margin-top: 55px;	

}
.pIcon{
	width: 160px;
    height: 160px;
    border-radius: 71px;
}

</style>

<body>

<div id="mypage">
	<div id="title" style="text-align: center;">
		<h1> 마이페이지 </h1>
	</div>

	
	<div id="profileArea">
		<div id="profilePhoto">
			<c:if test="${storedName == null }">
				<a href="/mypage/setProfile"><img src="/resources/img/mypage/userprofile.png" class="pIcon"></a>
			</c:if>
			<c:if test="${storedName != null}">
				<a href="/mypage/setProfile"><img src="${pageContext.request.contextPath}/upload/${storedName.storedName}" class="pIcon"></a>
			</c:if>
		</div>
	
		
		<div id="intro">
			<a href="/mypage/setProfile">${userIntro.userIntro}</a>
		</div>
	
		<div id="manageInfo">
			<div id="usersInfo">
				<ul id="updateInfo">
					<li class="infoTitle updateTitle" >회원 정보 관리</li>
					<li class="info updateUser"><a href="/mypage/updateInfo">회원 정보 변경</a></li>
					<li class="info updatePw"><a href="/mypage/updatePw">비밀번호 변경</a></li>
					<li class="info updayBody">Body 관리</li>
					<li class="info dropOut">탈퇴하기</li>
				
				</ul>
					
			</div>
		
		</div>
		
	</div>


</div>


</body>
</html>