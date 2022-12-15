<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<style type="text/css">

#mypage{
	width: 1200px;
	margin: 0 auto;
}
.infoTitle{
	font-size: 20px;
	margin: 10px 0;
}
.

#sidemenu{
	float: left;
	position: absolute;
}

#usersInfo{
	position: relative;
    left: 100px;
    top: 100px;
}
.info{
	padding: 5px;
}

</style>

<body>

<div id="mypage">
	<div id="title" style="text-align: center;">
		<h1> 마이페이지 </h1>
	</div>

	<div id="sidemenu">
		<div id="usersInfo">
		
			<ul id="updateInfo">
				<li class="infoTitle updateTitle" >회원 정보 관리</li>
				<li class="info updateUser"><a href="/mypage/updateInfo">회원 정보 변경</a></li>
				<li class="info updatePw"><a href="/mypage/updatePw">비밀번호 변경</a></li>
				<li class="info updayBody">Body 관리</li>
			
			</ul>
				
		</div>
	
	
	
	</div>


</div>


</body>
</html>