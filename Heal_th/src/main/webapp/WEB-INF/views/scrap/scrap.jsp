<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function scrapListCall() {
	$.ajax({
		type: "get"
		,url: "/scrap/list"
		,data: {
			}
		,dataType: "html"
		,success: function(scrapList){
			console.log("스크랩 불러오기 성공")
			//응답 데이터 출력
			$("#scrapList").html(scrapList)
		}
		,error: function(){
			console.log("스크랩 불러오기 실패")
		}
	})
}

$(document).ready(function(){
	scrapListCall()
})

</script>
</head>
<body>
<h1>스크랩 목록</h1>
<hr>
<div id="scrapList"></div>
</body>
</html>