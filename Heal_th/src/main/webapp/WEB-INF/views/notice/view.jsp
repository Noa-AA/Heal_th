<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>

<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
	$("#btnList").click(function() {
		$(location).attr("href", "./list")
	})
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "./write")
	})

	$("#btnUpdate").click(function() {
		$(location).attr("href", "/notice/update?noticeNo=${viewNotice.noticeNo}")
	})

	$("#btnDelete").click(function() {
		$(location).attr("href", "/notice/delete?noticeNo=${viewNotice.noticeNo}")
	})
})

$(document).ready(function(){ //수정 알림창
	    
	    let result = '<c:out value="${result}"/>';
	    
	    checkAlert(result);
	    
	    function checkAlert(result){
	        
	        if(result === ''){
	            reutrn;
	        }
	        
	        if(result === "update success"){
	            alert("게시글이 수정되었습니다.");
	        }
	        
	    }    
	    
	});
</script>

<style type="text/css">
table{
	width: 500px;
	table-layout: fixed;
	text-align: center;
}
.content{
   	width: 300px;
    height: 500px;
}
.bottomBtn{
	float: right;  
}
</style>

<body>

<div class="container">
<!-- <button type="button" class="btn btn btn-default" id="btnAll">전체글 관리</button> <button type="button" class="btn btn-default" id="btnNotice">공지사항</button> -->
<hr>

<table class="table table-bordered">
<tr>
	<td style="height: 70px;">제목</td>
	<td colspan="7">${viewNotice.noticeTtl }</td>
</tr>
<tr>
	<td>글번호</td>
	<td>${viewNotice.noticeNo }</td>

	<td>작성자</td>
	<td>${viewNotice.adminName }</td>

	<td>작성일</td>
	<td><fmt:formatDate value="${viewNotice.noticeDate }" pattern="yyyy.MM.dd HH:mm:ss" /></td>

	<td>조회수</td>
	<td>${viewNotice.noticeHit }</td>
</tr>
<tr>
	<td class="content" colspan="8">${viewNotice.noticeContent }</td>
</tr>
</table>

<hr>

<div class="bottomBtn">
<button id="btnUpdate" class="btn btn-default">수정</button> <button id="btnDelete" class="btn btn-default">삭제</button> 
<button id="btnWrite" class="btn btn-default">글쓰기</button> <button id="btnList" class="btn btn-default">목록</button>
</div>

</div>
</body>
</html>