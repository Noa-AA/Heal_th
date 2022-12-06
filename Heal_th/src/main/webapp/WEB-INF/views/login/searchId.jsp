<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){

			$("input").eq(0).focus()
	$("#btnsearchId").click(function(){
			console.log("인증받기 버튼 클릭")
			$("#emailCode")
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
					$("#result").html("일치하는 회원정보가 없습니다. 아이디 또는 이메일을 확인해주세요")
					$("#result").css("color","red")
					
				}
				
			}
			,error : function(){
				
				
			}
		}); //이메일 인증 완료
			
			
		
		
		
	})//클릭시 수행
	
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
	<h1 id="title">아이디찾기</h1>

	<div id="usernameArea">
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
	<div id="result"></div>
	<div id="btnCancel">
		<button type="button" onclick="cancel()">뒤로가기</button>
	</div>

</div>
</body>
</html>