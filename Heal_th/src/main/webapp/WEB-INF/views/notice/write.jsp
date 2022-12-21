<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>
<script type="text/javascript">
$(document).ready(function() { 
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
})
</script>
<body>

<div class="container">
<button type="button" class="btn btn btn-default" id="btnAll">전체글 관리</button> <button type="button" class="btn btn-default" id="btnNotice">공지사항</button>
<hr>

<form action="./write" method="post">
<div class="input_wrap">
	<label>제목</label><input type="text" name="noticeTtl" />
</div>
	<div class="input_wrap">
<label>내용</label><textarea rows="10" cols="50" name="noticeContent"></textarea>
</div>



<button type="submit">작성</button><button><a href="./list"/>취소</button>

</form>


</div>

</body>
</html>