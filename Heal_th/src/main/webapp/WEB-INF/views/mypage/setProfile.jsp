<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>


<script type="text/javascript">

$(document).ready(function(){
	
	//제출
	$("#btnIntro").click(function(){
		console.log("클릭버튼 누름")
		$("#profileForm").submit()
		
	})
	
	$("#btnCancel").click(function(){
			console.log("취소하기")
			history.go(-1)
		})
	
})

</script>

<style type="text/css">

#profile{
	padding-top: 150px;
	background-color: #f9fbfc;
}
#profileArea{
	width: 542px;
    height: 500px;
    position: relative;
    background-color: white;
    border-radius: 12px;
	box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
}

#boxArea{
	margin: 0px 60px;
    height: 500px;

}
.titleForHead{
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

#profileForm{
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
    outline: none;
    border: none;
    position:absolute;
    top:18px;
     font-size: 17px;
     left: 82px;
}
#userIntro{
position: absolute;
    left: 83px;
    top: 10px;
    width: 300px;
    height: 87px;
}

#btnArea{
	position: absolute;
    height: 50px;
    left: 60px;
	margin: 30px 0 0 0;
}

#btnIntro{
	width: 190px;
    height: 47px;
      border-radius: 8px;
	background-color: #7ca3f5;
	font-size: 17px;
	color:white;
	margin-right: 40px;
}

input[type=file]::file-selector-button{
	width: 108px;
    height: 33px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:17px;
    border-radius: 8px;
}

input[type=file]::file-selector-button:hover{
	background-color: #7ca3f5;
	color:white;
}
#btnCancel{
	width: 190px;
    height: 47px;
      border-radius: 8px;
	background-color: transparent;
	 border:2px solid #7ca3f5;
	font-size: 17px;
	color:#7ca3f5;
	
}

</style>


<body id="profile">

	<div id="profileArea">
		<div id="boxArea">
			<div id="title">
				<span class="titleForHead">프로필 </span>
			</div>
			
				<div id="profileForm">
					<form action="/mypage/setProfile" method="post" id="profileForm" enctype="multipart/form-data">
						<div id="updatePhoto" class="inputArea">
							<label for="userPhoto">
								<span class="formTitle">프로필 사진</span>
							</label>
							<input type="file" name="userPhoto" id="userPhoto" class="inputInfo">
						</div>	
						<div id="selfIntro"  class="inputArea">
								<label for="userIntro">
									<span class="formTitle">자기소개</span>
								</label>
								<textarea id="userIntro" name="userIntro" id="userIntro" ></textarea>
							</div>
							
						<div id="btnArea">
							<button type="button" id="btnIntro">적용</button>
							<button type="button" id="btnCancel">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	


</body>
<jsp:include page="../layout/footer.jsp"/>
</html>