<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<style type="text/css">
* {
    margin: 0;
    padding: 0;
}

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

#btnInsert {
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

#container{width: 1200px;}


</style>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnInsert").click(function() {
		confirm("게시글을 등록하시겠습니까?");
		
		$(this).parents("form").submit();
		alert("50 포인트가 적립됐습니다");
	})

})


</script>


</head>

<body>

<div id="container" name="container">
<form action="/board/dWrite" method="post">

<h1>식단 공유</h1>

<div>
	<label for="dTitle">제목</label>
	<input id="dTitle" name="dTitle" placeholder="제목을 입력해주세요">
</div>

<div>
	<label for="prodClassification">제품 분류</label>
	<input id="prodClassification" name="prodClassification">
	
</div>

<div>
	<label for="file">첨부파일</label>
	<button type="button" id="file" name="file">첨부파일</button>
</div>
	<label for="file">내용</label>
	<textarea id="dContent" name="dContent" required id="dContent"></textarea>
<div>

</div>

<div class="text-center">
	
		<a class="btn block" id="btnCancle" onclick="if ( confirm('정말 취소하시겠습니까?') == false ) { return false; }" href="/board/reviewBoard" >취소</a>
	<button type="submit" class="btn btn-primary" id="btnInsert">등록</button>
</div>

<div>


</div>

</form>
</div>

</body>
</html>









