<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/adminheader.jsp" />
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
	$("#btnNotice").click(function() {
		$(location).attr("href", "/notice/list")
	})
})

</script>

<style type="text/css">
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background: linear-gradient(to right, #3f94d6 0 , #1869a7);
    height: 65px;
    line-height: 67px;
    color: white;	
}
.btnWrap{
	margin: 15px 2px;
}
.menuBtn{
	width: 150px; 
	height: 40px;
	background-color: white;
	border: 1px solid #3f94d6;
	color: #1869a7;
	padding: 5px;
}
.menuBtn:hover{
color: white; 
background: linear-gradient(to right, #3f94d6 0 , #1869a7);
}
#btnNotice{
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
}
#btnReport{
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
}

#reportList{
	height: 585px;
	overflow: scroll;
}
#reportListTable{
	font-size: 17px;
}

/* #reportListTable th{ */
/* 	text-align: center; */
/* } */
/* #reportListTable th,td{ */
/* 	border : 1px solid #ccc; */
	
} 
#reportListTable tr td:nth-child(2){ 
	width: 1105px;
} 

</style>
</head>
<body>
<div class="admin_content_subject"><span>게시물 관리</span></div>
<div class="btnWrap">
<h3><button type="button" id="btnNotice" class="menuBtn">공지사항</button><button type="button" id="btnReport" class="menuBtn">신고글 관리</button></h3>
</div>
<div id="reportList"></div>
</body>
</html>