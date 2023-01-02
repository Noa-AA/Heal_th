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
#dropOut{
	padding-top: 150px;
	  background-color: #f9fbfc;
}

#dropOutArea {
		width: 542px;
    height: 490px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
    
}
inputInfo:focus{
	border-bottom-color:#7ca3f5; 
}

#boxArea{
	margin: 0px 60px;
    height: 490px;

}
#titleForHead{
	font-size: 30px;
    font-weight: 600;
    color: gray;
}
#beforeNotice{
	height: 80px;
    margin-top: 30px;
}

.formTitle{
	font-size: 17px;
	color:gray;
    margin: 10px 0 0;
}
#title{
	padding-top: 60px;
    text-align: center;
}

#dropOutForm{
	margin-top: 0;
}


.inputArea{
	margin: 0;
	position:relative;
	height:114px;
}
.formTitle{
	font-size: 17px;
	color:gray;
	 position: absolute;
    margin: 10px 0 0;
}
#formnotice01{
	font-size: 17px;
	color:gray;
	padding: 0 60px;

}
#formnotice02{
	font-size: 17px;
	color:gray;
	padding: 0 19px;

}


.inputInfo{
	width: 422px;
    height: 33px;
    margin-left: 0;
    outline: none;
    border: none;
    border-bottom: 2px solid lightgray;
    position:absolute;
    top:39px;
     font-size: 17px;
}
.resMsg{
	position: absolute;
    top: 85px;
    margin: 7px 0 0;
}

#btnArea{
	position: absolute;
    height: 50px;
    left: 60px;
	margin: 16px 0 0 0;
}
#btnDropOut,#btnCancel{
	width: 190px;
    height: 47px;
     border-radius: 8px;
}
#btnDropOut{
	background-color: #7ca3f5;
	font-size: 17px;
	color:white;
}

#btnCancel{
	margin-left: 40px;
	font-size: 17px;
    color: #7ca3f5;
    background-color: transparent;
    border:2px solid #7ca3f5;
}
</style>
<body id="dropOut">
	<div id="dropOutArea">
		<div id="boxArea">
				
				<div id="title">
					<span id="titleForHead">회원 탈퇴를 위한 비밀번호 확인</span>
				</div>
					
					<div id="beforeNotice">
						<span id="formnotice01">회원 탈퇴 후 아이디를 복구 할 수 없습니다.</span>
						<span id="formnotice02"> 회원 탈퇴 진행 전 현재 사용중인 비밀번호를 입력해주세요</span>
					</div>
					<div id="dropOutFormArea">
						<form action="/mypage/dropOut" method="post" id="dropOutForm">
							<div id="inputForm" class="inputArea">
							<label for="userPw">
								<span class="formTitle newPw">비밀번호</span>			
							</label>				
								<input type="password" id="userPw" name="userPw" class="inputInfo"> 
							</div>
							
							<c:if test="${resultDrop }" >
								<div id="resulMsg" class="resMsg">
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