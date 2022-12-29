<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/board/dietBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/dUpdate?dietNo=${viewBoard.dietNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/dietDelete?dietNo=${viewBoard.dietNo }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

#btnList {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

#btnDelete {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

#btnUpdate {
    width: 100px;
    background: #7ca3f5;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

</style>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">

<tr>
	<td class="info">글번호</td><td>${viewBoard.dietNo }</td>
	<td class="info">카테고리 번호</td><td>${viewBoard.categoryNo }</td>
</tr>
<tr>
	<td class="info">회원번호</td><td>${viewBoard.userNo }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.dInstDate }" pattern="yy-MM-dd"/></td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.dHit }</td>
	<td class="info">좋아요</td><td>${viewBoard.dThumbs }</td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewBoard.dTitle }</td>
</tr>
<tr>
	<td class="info" colspan="4" style="text-align: center">식단 공유 게시글</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">제품 분류: ${viewBoard.prodClassification}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">내용:</td>
</tr>
<tr>	
	<td colspan="4" style="border: none;">${viewBoard.dContent}</td>
</tr>


</table>

<br><br>

<jsp:include page="../file/file.jsp" /> <!-- 뷰페이지 사진목록 자리에 넣기 -->

<br><br><br><br>

</div><!-- .container end -->


<jsp:include page="../addOns/addOn.jsp" />

 <br><br><br><br>

<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
	<c:if test="${userNo eq viewBoard.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<br><br><br><br><br><br>


<jsp:include page="../comment/board.jsp" />


<br><br><br><br><br><br><br><br>















