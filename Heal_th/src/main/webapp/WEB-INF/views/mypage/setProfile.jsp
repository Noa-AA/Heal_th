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

body{
	padding-top: 0;
}
#profileArea{
	width: 1200px;
	margin: 0 auto;
}
#title span {
	font-size: 40px;
}

#title{
	text-align: center;

}

#content{
	position: absolute;
    left: 600px;
    margin-top: 50px;
}
</style>


<body>

	<div id="profileArea">
		<div id="title">
			<span>프로필 </span>
		</div>
		
		<div id="content">
			<form action="/mypage/setProfile" method="post" id="profileForm" enctype="multipart/form-data">
				<div id="tableArea">
				<table id="profileTable">
					<colgroup>
						<col id="profileCol"/>
					</colgroup>
					<tbody>
						<tr id="photo">
							<th>프로필 사진</th>
							<td><input type="file" name="userPhoto" id="userPhoto"></td>
						</tr>
						<tr id="intro">		
							<th>자기소개</th>
							<th><textarea id="introText"></textarea></th>
					</tbody>
				</table>
		
				</div>		
					
				<div class="btnArea">
					<button type="button" id="btnIntro">적용</button>
					<button type="button" id="btnCancel">취소</button>
				</div>
			</form>
		</div>
	</div>
	


</body>
</html>