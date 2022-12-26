<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />
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
			console.log(scrapList)
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
<style type="text/css">
#scrapListTable{
	margin : 0 auto;
}
#scrapListTable th{
	text-align: center;
}
#scrapListTable th,td{
	border : 1px solid #ccc;
	
}
/* #scrapList tbody td{ */
/* 	 width:400px; */
/* } */
#scrapListTable tr td:nth-child(2){
	width: 350px;
}

</style>
</head>
<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">스크랩 목록</p>
	</div>
</div>
<div id="scrapList"></div>
</body>
<jsp:include page="../layout/footer.jsp" />
</html>