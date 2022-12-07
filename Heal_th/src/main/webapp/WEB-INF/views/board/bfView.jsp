<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/board/bfBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/bfUpdate?bfNo=${viewBoard.bfNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/bfDelete?bfNo=${viewBoard.bfNo }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}


</style>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">

<tr>
	<td class="info">글번호</td><td>${viewBoard.bfNo }</td>
	<td class="info">카테고리 번호</td><td>${viewBoard.categoryNo }</td>
</tr>
<tr>
	<td class="info">회원번호</td><td>${viewBoard.userNo }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.bfInstDate }" pattern="yy-MM-dd"/></td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.bfHit }</td>
	<td class="info">좋아요</td><td>${viewBoard.bfThumbs }</td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewBoard.bfTitle }</td>
</tr>
<tr>
	<td class="info" colspan="4" style="text-align: center">Before (운동 전)</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">운동 전 정보</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">신장: ${viewBoard.height}</td>
</tr>
<tr>	
	<td colspan="4" style="border: none;">성별: ${viewBoard.gender}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">몸무게: ${viewBoard.weight}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">운동종류: ${viewBoard.bfExercise}</td>
</tr>	

<tr>
	<td class="info" colspan="4" style="text-align: center">설정 목표</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">목표 체중: ${viewBoard.gWeight}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">목표기간: ${viewBoard.sDate} - ${viewBoard.eDate}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">선택 운동: ${viewBoard.seleExercise}</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">다짐글</td>
</tr>
<tr>
	 <td colspan="4" style="border: none;">${viewBoard.beforeCon}</td>
</tr>

<tr>
	<td class="info" colspan="4" style="text-align: center">After (운동 후)</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">운동 후 현재정보</td>
</tr>
<tr>
	<td colspan="4" style="border: none;">몸무게: ${viewBoard.cWeight}</td>
</tr>
<tr>
	<td  colspan="4" style="border: none;">결과: ${viewBoard.gResult}</td>
</tr>
<tr>	
	<td colspan="4" style="border: none;">후기글</td>
</tr>
<tr>	
	<td colspan="4" style="border: none;">${viewBoard.afterCon}</td>
</tr>


</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${userNo eq viewBoard.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<br><br>



<br><br>

</div><!-- .container end -->

<jsp:include page="../comment/board.jsp" />


<br><br><br><br><br><br><br><br>















