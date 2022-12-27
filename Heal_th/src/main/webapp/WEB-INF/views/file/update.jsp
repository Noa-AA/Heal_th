<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#imageUp{
display: none;
}
</style>
<script type="text/javascript">
function updateListCall() {
	$.ajax({
		type: "get"
		,url: "/file/updateList"
		,data: {
			boardNo:${boardNo}
			,category:${categoryNo }
			}
		,dataType: "html"
		,success: function(List){
			console.log("사진 불러오기 AJAX 성공")
			//응답 데이터 출력
			$("#photoContainer").html(List)
			
		
		}
		,error: function(){
			console.log("사진 불러오기 AJAX 실패")
		}
	})
}
$(document).ready(function(){
	updateListCall()
	
})
</script>
</head>
<body>
<h1>수정수정</h1>
<hr>
<form action="/file/write" method="post" enctype="multipart/form-data">
<button type="button" id="fileUpload" onclick="fileup()">사진 올리기</button>
<input type="file" id="imageUp" name="multiFile" accept="image/*" onchange="setPreview(event)" multiple/><br><br>
</form>
${pageContext.request.contextPath}
<div id="photoContainer"></div>
</body>
</html>