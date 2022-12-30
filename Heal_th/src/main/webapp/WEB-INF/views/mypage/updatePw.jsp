<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		
	$("#btnchkPw").click(function(){
		console.log("click")
			$.ajax({
				type:"post"
				,url : "/mypage/chkUsingPw"
				,data:{
					userId : $("#userId").val(),
					userPw: $("#userPw").val()
					
				}
			,dataType: "json"
			,success : function (res){
				
				if(res){
					console.log("비밀번호 일치")
					location.href="/mypage/setUserPw"
					
				}else {
					console.log("비밀번호 불일치")
						$("#resultPw").html("비밀번호를 다시 한번 확인해주세요")
						$("#resultPw").css("color","red")
					}
				}
				,error :function(){
					 console.log("오류입니다.")
					 alert("시스템 오류  다시 진행해주세요")
				 
				}
				
			
				
				
			})
			
	})

		$("#btnCancel").click(function(){
			console.log("취소하기")
			history.go(-1)
		})
	})

		
</script>

<style type="text/css" >
#updatePw{
	padding-top: 150px;
}

#beforeUpdatePw {
	width: 542px;
    height: 560px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
 }
 
.inputInfo:focus{
	border-bottom-color:#7ca3f5; 
}

#boxArea{
	margin: 0px 60px;
    height: 560px;

}
#titleForHead{
	font-size: 30px;
    font-weight: 600;
    color: gray;
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

#beforeUpdatePwForm{
	margin-top: 35px;
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
#btnchkPw,#btnCancel{
	width: 190px;
    height: 47px;
     border-radius: 8px;
}
#btnchkPw{
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
#description{
	padding: 20px;
}
#searchPw{
 	 position: absolute;
    width: 300px;
    height: 32px;
    top: 478px;
}
.gotoSearchPw:hover{
	color: #7ca3f5;
}
</style>

<body id="updatePw">

	<div id="beforeUpdatePw">
		<div id="boxArea">
			<div id="title">
				<span id="titleForHead">비밀번호 변경하기</span>
			</div>
			
			<div id="description">
				<span class="formTitle formDescription">비밀번호 변경 전 현재 사용 중인 비밀번호를 입력해주세요</span>
			</div>
			
			<div id="beforeUpdatePwForm">
				<div id="chkUsingPwForm">
					<div id="showId" class="inputArea"> 
						<label for="userId">	
							<span class="formTitle userId">아이디</span>
						</label>
						<input type="text" id="userId" name="userId" class="inputInfo" value="${userId}" readonly="readonly">
					</div>
					
					<div id="inputUsingPw" class="inputArea">
						<label for="userPw">
							<span class="formTitle usingPwChk">현재 비밀번호</span>
						</label>		
							<input type="password" id="userPw" name="userPw" class="inputInfo">
						<div id="resultPw" class="resMsg"></div>
					</div>

					<div id="btnArea">
						<button type="button" id="btnchkPw" >비밀번호 확인</button>
						<button type="button" id="btnCancel">취소하기</button>
					</div>
				</div>
				<div id="searchPw">
					<a href="/login/searchPw"><span class="formTitle gotoSearchPw">비밀번호가 기억나지 않아요</span></a>
				</div>
			
			
			</div>
		</div>
	</div>

</body>
</html>