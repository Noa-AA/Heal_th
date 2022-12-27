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
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background: linear-gradient(to right, #3f94d6 0 , #1869a7);
    height: 80px;
    line-height: 80px;
    color: white;	
}

.btnWrap{
	margin: 15px 2px;
}
.menuBtn{
	width: 130px; 
	height: 50px;
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
#btnAll{
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
}
.search_area{
	padding-top: 30px;
  }
.search_area input{
    height: 30px;
  width: 250px;
}
.search_area button{
   width: 25px;
  height: 26px;
}

	/* 검색 영역 */
.search_wrap{
	margin-top:15px;
	text-align: center;
}
.search_input{
    position: relative;
    text-align:center;	
}
.search_input input[name='keyword']{
	padding: 4px 10px;
    font-size: 15px;
    height: 25px;
    line-height: 20px;
}
.search_btn{
	height: 50px;
    width: 30px;
    font-weight: 600;
    font-size: 15px;
    line-height: 20px;
    position: absolute;
    margin-left: 5px;
    background-color: ##acbed0;
}
.bottomBtn{
	float: right;  
	
}

</style>
<div class="container">

<div class="admin_content_subject"><span>게시물 관리</span></div>
<div class="btnWrap">
<h3><button type="button" id="btnNotice" class="menuBtn">공지사항</button><button type="button" id="btnAll" class="menuBtn">신고글 관리</button></h3>
</div>
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
		<td><a href="/notice/view?noticeNo=${notice.noticeNo }">${notice.noticeTtl }</a></td>
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
		<div class="search_input">
			<input type="text" name="keyword" value="${pageMaker.search.keyword }">
			<button class='search_btn'>
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
		</div>
	</div>
</div>

<button id="btnWrite" class="bottomBtn">글쓰기</button>

</div>
<%@include file="../notice/paging.jsp" %>


</body>
</html>
