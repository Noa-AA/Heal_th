<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>
<script type="text/javascript">
$(document).ready(function() { 
	
	$("#btnNotice").click(function() {
		$("form").submit();
	})
})
</script>
<body>

<div class="container">
<button type="button" class="btn btn btn-default" id="btnAll">전체글 관리</button> <button type="button" class="btn btn-default" id="btnNotice">공지사항</button>
<hr>

<form action="./update" method="post">
<input type="hidden" name="noticeNo" value="${param.noticeNo }">
<div><label>제목</label><input type="text" name="noticeTtl" value="${updateNotice.noticeTtl }"></div>

<div><label>본문</label><textarea rows="10" cols="50" name="noticeContent">${updateNotice.noticeContent }</textarea></div>

<button type="submit">수정</button><button><a href="./view"/>취소</button>
</form>

</div>
</body>
</html>