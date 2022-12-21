<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function reportListCall() {
	$.ajax({
		type: "get"
		,url: "/report/list"
		,data: {
			}
		,dataType: "html"
		,success: function(reportList){
			console.log("신고목록 불러오기 성공")
			//응답 데이터 출력
			$("#reportList").html(reportList)
			console.log(reportList)
		}
		,error: function(){
			console.log("신고목록 불러오기 실패")
		}
	})
}

$(document).ready(function(){
	reportListCall()
})

</script>
</head>
<body>
<h1>신고 목록</h1>
<hr>
<div id="reportList"></div>
</body>
</html>