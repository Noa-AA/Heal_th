<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 인증 게시글 작성</title>

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<style type="text/css">

#btnCancle {
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
	margin-right: 15px;
}

#btnWrite {
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

</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		$(this).parents("form").submit();
		alert("50 포인트가 적립되었습니다");
	});
	
})


</script>


<h1>운동 인증</h1>

<form action="/board/vWrite" method="post">

<table>
	<tr>
		<td>제목</td>
		<td><input type="text" id="vTitle" name="vTitle" required id="vTitle"></td>
	</tr>
	
	<tr>
		<td>운동 종목</td>
		<td><input type="text" id="exercise" name="exercise" required id="exercise"></td>
	</tr>
	
	<tr>
		<td>소요 시간</td>
		<td><input type="text" id="time" name="time" required id="time"></td>
	</tr>
	
	<tr>
		<td>소비 칼로리</td>
		<td><input type="text" id="kcal" name="kcal" required id="kcal">kcal</td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><button>첨부파일</button></td>
	</tr>
	
	<tr>
		<td>내용</td>
	</tr>
	<tr>
		<td><textarea id="verifyContent" name="verifyContent" required id="verifyContent"></textarea></td>
	</tr>
	
</table>

<div class="text-center">
	
		<a class="btn block" id="btnCancle" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/verifyBoard" >취소</a>
	<button type="submit" class="btn btn-primary" id="btnWrite">등록</button>
</div>


</form>



</body>
</html>