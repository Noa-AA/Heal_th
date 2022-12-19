<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#goScrap").click(function(){ 
		$.ajax({
			type: "post"
			,url: "/scrap/add"
			,data: {
					boardno:1	
					,category:4
				}
			,dataType: "html"
			,success: function(res){
				console.log("addScrap AJAX 성공")
				
				if(confirm("글이 저장되었습니다\n스크랩 목록으로 이동하시겠습니까?")){
					location.replace('/scrap/list') //로그인 페이지 이동
					
				}else{
					return false
				}
	
			}
			,error: function(){
				console.log("addScrap AJAX 실패")
			}
		})
		
	})
})
</script>
</head>
<body>

<h1>게시글</h1>
<button type="button" id="goScrap">스크랩하기</button>
</body>
</html>