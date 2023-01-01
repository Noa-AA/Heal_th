<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/board/verifyBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/vUpdate?verifyNo=${viewBoard.verifyNo }"
	})
	
	$("#btnDelete").click(function() {
		confirm("게시글을 정말삭제하시겠습니까?");
		location.href = "/board/vDelete?verifyNo=${viewBoard.verifyNo }"
		alert("게시글이 삭제됐습니다");
	})
})
</script>



<style type="text/css">

table {
	table-layout: fixed;
}

* {
    margin: 0;
    padding: 0;
}

body{padding: 0;}

a {
    color: #000;
    text-decoration: none;
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
	<td class="info">글번호</td><td>${viewBoard.verifyNo }</td>
	<td class="info">카테고리 번호</td><td>${viewBoard.categoryNo }</td>
</tr>
<tr>
	<td class="info">회원번호</td><td>${viewBoard.userNo }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.vInstDate }" pattern="yy-MM-dd"/></td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.vHit }</td>
	<td class="info">좋아요</td><td>${viewBoard.vThumbs }</td>
</tr>

<tr>
	<td class="info" colspan="4" style="text-align: center">운동인증 게시글</td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewBoard.vTitle }</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">운동 종목: ${viewBoard.exercise }</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">소요 시간: ${viewBoard.time}</td>
</tr>
<tr>	
	<td colspan="4" style="border: none;">소비 칼로리: ${viewBoard.kcal}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">내용: ${viewBoard.verifyContent}</td>
</tr>

</table>


<br><br>

<jsp:include page="../file/file.jsp" /> <!-- 뷰페이지 사진목록 자리에 넣기 -->

<br><br><br><br><br>

<jsp:include page="../addOns/addOn.jsp" />

<br><br><br><br><br>

<div class="text-center">
	<button id="btnList">목록</button>
	
	<c:if test="${userNo eq viewBoard.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<br><br><br><br><br><br>

</div><!-- .container end -->

<jsp:include page="../comment/board.jsp" />


<br><br><br><br><br><br><br><br><br><br>


<%@include file="../layout/footer.jsp" %>
