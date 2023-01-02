<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/adminheader.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	
	ClassicEditor
	.create(document.querySelector('#noticeContent_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
})
</script>

<style type="text/css">
/* 관리자 컨텐츠 메인 영역 */
.admin_content_wrap{
	display: grid;
 	place-items: center;
}
h1{
	margin-bottom: 35px;
}
.form_section{
	width: 1200px;
    margin-left: 2%;
    margin-top: 5px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form_section_title{
	padding: 15px 35px;	
}
.form_section_title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}
.form_section_content{
	padding: 20px 35px;
    border-top: 1px solid #fff;	
}
.form_section_content input{
	width: 98%;
    height: 35px;
    font-size: 20px;
    padding: 5px 1%;
}
.bottomBtn{
	text-align: center;
	margin: 25px;
}
button{
	width: 55px;
	height: 35px;
	font-size: 18px;
}
.ck-content {						/* ckeditor 높이 */
    height: 270px;
}
</style>
<body>

<div class="admin_content_wrap">
<h1>게시글 작성</h1>
 <div class="admin_content_subject"><span></span></div>
	<div class="admin_content_main">

	<form action="./write" method="post">
	<div class="form_section">
		<div class="form_section_title">
			<label>제목</label>
		</div>
		<div class="form_section_content">	
			<input type="text" name="noticeTtl" />
		</div>
	</div>

	<div class="form_section">
		<div class="form_section_title">
			<label>내용</label>
		</div>
		<div class="form_section_content">	
			<textarea name="noticeContent" id="noticeContent_textarea"></textarea>
		</div>
	</div>

<div class="bottomBtn">
	<button type="submit">작성</button>   <button><a href="./list"/>취소</button>
</div>

</form>

</div>
</div>

</body>
</html>