<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
	
		//input 초기화
		$("#userPw").focus(function(){
			$("#resultMsg").html("")
		})
		 $("#chkSetPw").focus(function(){
		   $("#resultMsgChk").html("")
	   })
	
		//비밀번호 유효성 검사
		$("#userPw").change(function(){
				console.log("비밀번호 유효성 검사 - 비밀번호 재설정")
		
			
			//기존에 사용한 비밀번호인지 확인하기
			$.ajax({
				type: "post"
				,url : "/mypage/setUserPw"
				,data :{
					userPw : $("#userPw").val()
				}
				,dataType : "json"
				,success : function(res) {
					console.log(res)
					console.log("사용된 비밀번호 확인")
					//false = 재설정 가능 true = 설정 불가
					if(res){
					console.log("비밀번호로 사용 가능")						
					validateUpdatePw()

					}else {
						console.log(res)
						console.log("비밀번호 재설정 불가")
						$("#resultMsg").html("이미 사용중인 비밀번호 입니다.")
						$("#resultMsg").css("color","red")
					}
				}
				,error : function(){
					console.log("오류")
				}
			})
			
			
		})//기존 사용중인 비밀번호 확인완료
		
		$("#chkSetPw").keyup(function(){
			validateCkh()
		})
		
		//폼 전송하기
		$("#btnUpdatePw").click(function(){
			console.log("버튼 클릭")
			if($("#chkSetPw").val() ==""){
				$("#resultMsgChk").html("비밀번호 확인을 해주세요")
				$("#resultMsgChk").css("color","red")
				$("#resultMsgChk").focus()
				return false
			}
			
			//유효성 검사 됐을 때 submit 
			if( validateUpdatePw()&&validateCkh()){
				$("#updatePwForm").submit()
				alert("비밀번호가 변경되었습니다. 다시 로그인 해주세요")
					
				}
		})
		
	
		
		
})
	
function validateUpdatePw(){
	
	let updatePw = document.getElementById("userPw").value
	
	if(!/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(updatePw)){
		console.log("비밀번호 유효성 검사 실패")
		document.getElementById("resultMsg").innerHTML="<span style='color:red;'> 비밀번호는 영문대소문자,숫자,특수문자를 모두 포함 8자 이상이어야 합니다.</span>"
		return false;
	}else {
		console.log("비밀번호 확인")
		document.getElementById("resultMsg").innerHTML="<span style='color:green;'> 사용가능한 비밀번호 입니다.</span>"
		return true;
	}
}		

	function validateCkh(){
		let updatePw = document.getElementById("userPw").value
		let chkUpdatePw = document.getElementById("chkSetPw").value
		
		//비밀번호 입력 확인
		if(updatePw != chkUpdatePw ){
			console.log("비밀번호 불일치")
			document.getElementById("resultMsgChk").innerHTML="<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>"
			return false;
		}else {
			console.log("비밀번호 일치")
			document.getElementById("resultMsgChk").innerHTML="<span style='color:green;'>비밀번호 확인 완료</span>"
			return true;
		}
	} 
	
</script>





<body>

<div id="newPw">
	<div id="newPwTitle">
		<h1>비밀번호 설정</h1>
	
	</div>

	<form action="/mypage/setNewPw" method="post" id="updatePwForm">
	<div id="updatePw">
		<label for="userPw">비밀번호 
			<input type="password" name="userPw" id="userPw">
		</label>
	</div>
	
	<div id="resultMsg"></div>	

	<div id="chkUpdatePw">
		<label for="chkPw"> 비밀번호 확인
			<input type="password" name="chkSetPw" id="chkSetPw">
		</label>
	</div>

	<div id="resultMsgChk"></div>	
	<button type="button" id="btnUpdatePw">비밀번호 설정하기</button>
	</form>
</div>


</body>

</body>
</html>