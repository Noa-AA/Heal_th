<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/store/list"
	})
})
$(document).ready(function() {
	$("#btncartList").click(function() {
		location.href = "/store/cartlist"
	})
})


</script>

<h1>장바구니</h1>


장바구니에 성공적으로 담겼습니다.
	
	<button type="button" id="btnList" class="btn btn-default btn-lg" >목록으로 돌아가기</button>	
	<button type="button" id="btncartList" class="btn btn-default btn-lg" >장바구니 바로가기</button>	
</body>
</html>