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

<style>

.cartmsg{
	margin-left: 35%;
    border: 1px solid #ccc;
    width: 370px;
    height: 370px;
	padding:40px;
	padding-top:135px;
	text-align: center;
}


.btnt{
	width: 120px;
    height: 40px;
    background-color: transparent;
    border: 2px solid #7ca3f5;
    color:#7ca3f5;
    font-size:13px;
    border-radius: 8px;
    margin-top: 20px;
    margin-right: 12px;
}


</style>


<div class="cartmsg">
<span style="font-size:20px">장바구니에 성공적으로 담겼습니다.</span>
	<br>
	<button type="button" id="btnList" class="btnt" >목록으로 돌아가기</button>	
	<button type="button" id="btncartList" class="btnt" >장바구니 바로가기</button>	
</div>
</body>
</html>