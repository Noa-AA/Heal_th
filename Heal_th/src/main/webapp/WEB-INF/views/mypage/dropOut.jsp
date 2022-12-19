<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>


<script type="text/javascript">
$(document).ready(function(){
	
	
	//취소하기 버튼 클릭 
	$("#btnCancel").click(function(){
		console.log("취소하기 버튼 클릭")
		history.go(-1)
	})

	//탈퇴하기 버튼 클릭
	$("#btnDropOut").click(function(){
	console.log("탈퇴하기 버튼 클릭")
	var con =confirm("탈퇴하시겠습니까? 탈퇴 이후 아이디는 복구되지 않습니다.")
		//취소 버튼 클릭시 처리	
	if(!con){
			console.log("취소버튼 클릭")
			return false;
		}
	
		$("#dropOutForm").submit()
	})
	
})

</script>
<style type="text/css">
#dropOutArea{
	width: 1200px;
	margin: 0 auto;
	text-align:  center;
}

#dropOutTitle span {
	font-size: 30px;
}

</style>
<body>
<div id="dropOutArea">

		<div id="chkUserPw">
			<div id="dropOutTitle">
				<span>회원 탈퇴를 위한 비밀번호 확인</span>
			</div>
			
			<div id="beforeNotice">
				<span>회원 탈퇴 후 아이디를 복구 할 수 없습니다.<br>
					  회원 탈퇴 진행 전 현재 사용중인 비밀번호를 입력해주세요
				</span>
			</div>
			<div id="formArea">
				<form action="/mypage/dropOut" method="post" id="dropOutForm">
					<div id="inputForm">
					<label for="userPw">
							비밀번호			
						<input type="password" id="userPw" name="userPw"> 
					</label>				
				</div>
				
				<c:if test="${resultDrop }">
					<div id="resulMsg">
						<span style="color:red;"> 비밀번호가 틀립니다. 한번 더 확인해주세요</span>
					</div>
				</c:if>
				<div id="btnArea">
					<button type="button" id="btnDropOut">탈퇴하기</button>
					<button type="button" id="btnCancel">취소하기</button>
				</div>	
				
				
				</form>
			
		
			</div>		
		
		</div>





</div>



</body>
</html>