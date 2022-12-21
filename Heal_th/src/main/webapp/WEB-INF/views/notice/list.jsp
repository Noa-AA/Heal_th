<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="../layout/adminheader.jsp" />
<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "./write")
	})
})
$(document).ready(function(){ //등록 알림창
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "write success"){
            alert("공지사항 등록이 완료되었습니다.");
        }
        if(result === "delete success"){
            alert("게시글이 삭제되었습니다.");
        }
        
    }    
    
});
</script>
<style type="text/css">
h1{text-align: center;}

.search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .search_area input{
      height: 30px;
    width: 250px;
  }
  .search_area button{
     width: 100px;
    height: 36px;
  }
.bottomBtn{
	float: right;  
}
</style>

<div class="container">

<h1>공지사항</h1>
<button type="button" class="btn btn btn-default" id="btnAll">전체글 관리</button> <button type="button" class="btn btn-default" id="btnNotice">공지사항</button>
<hr>

<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 50%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 15%;">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.noticeNo }</td>
		<td><a href="/notice/view?noticeNo=${notice.noticeNo }" style="color: black;">${notice.noticeTtl }</td>
		<td>${notice.userNo }</td>
<%-- 		<fmt:formatDate value="${notice.noticeDate }" var="dateValue" pattern="yyyy.MM.dd HH:mm:ss"/> --%>
		<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd" /></td>
		<td>${notice.noticeHit }</td>
	</tr>
</c:forEach>


</tbody>

</table>

<div class="search_wrap">
	<div class="search_area">
		<input type="text" name="keyword" value="${pageMaker.search.keyword }">
		<button>검색</button>
	</div>
</div>


<button id="btnWrite" class="bottomBtn">글쓰기</button>

</div>

<%@include file="../notice/paging.jsp" %>


</body>
</html>
