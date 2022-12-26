<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />
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

<style type="text/css">
#reportListTable{ 
	margin: 0 auto;
} 

#reportListTable th{
	text-align: center;
}
#reportListTable th,td{
	border : 1px solid #ccc;
	
}
/* #scrapList tbody td{ */
/* 	 width:400px; */
/* } */
#reportListTable tr td:nth-child(2){
	width: 350px;
}

</style>
</head>
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">신고 목록</p>
	</div>
</div>
<div id="reportList"></div>
</body>
<jsp:include page="../layout/footer.jsp" />
</html>