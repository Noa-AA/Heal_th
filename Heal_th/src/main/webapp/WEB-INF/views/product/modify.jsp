<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />
<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	ClassicEditor
	.create(document.querySelector('#pDetail_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	$("#cancelBtn").click(function() {
		$(location).attr("href", "./list")
	})
	
	$("#modifyBtn").click(function() {
		$(location).attr("href", "/product/modify?prodNo=${goodsInfo.prodNo}")
	})

	$("#deleteBtn").click(function() {
		$(location).attr("href", "/product/delete?prodNo=${goodsInfo.prodNo}")
	})

	
// 	/* 취소 버튼 */
// 	$("#cancelBtn").on("click", function(e){
// 		e.preventDefault();
// 		$("#moveForm").submit();	
// 	});	
	
// 	/* 수정 버튼 */
// 	$("#modifyBtn").on("click", function(e){
// 		e.preventDefault();
// 		$("#modifyForm").submit();
// 	});	
	
// 	/* 삭제 버튼 */
// 	$("#btnDelete").on("click", function(e){
// 		e.preventDefault();
// 		let moveForm = $("#moveForm");
// 		moveForm.find("input").remove();
// 		moveForm.append('<input type="hidden" name="prodNo" value="${productInfo.prodNo}">');
// 		moveForm.attr("action", "/product/delete");
// 		moveForm.attr("method", "post");
// 		moveForm.submit();
// 	});	
	
	
	/* 이미지호출 */
	let prodNo = '<c:out value="${goodsInfo.prodNo}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/product/getAttachList", {prodNo : prodNo}, function(arr) {
		
		/* 이미지 없을때 */
		if(arr.length === 0){
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/product/NoImage.png'>";
			str += "</div>";
			
			uploadResult.html(str);	
			
			return;
		}
		
		let str = "";
		let obj = arr[0];
		
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";		
		
		uploadResult.html(str);					
		
	})
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function (e) {
		deleteFile();
	})
	
	/* 이미지 파일 삭제 */
	function deleteFile() {
		$("#result_card").remove();
	}
	
})	
</script>
<style type="text/css">
/* 관리자페이지 컨텐츠 영역 */
.admin_content_wrap{
    width: 80%;
    float:left;
    min-height: 700px;
}
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background-color: #6AAFE6;
    height: 80px;
    line-height: 80px;
    color: white;	
}
/* 관리자 컨텐츠 메인 영역 */
.form_section{
	width: 95%;
    margin-left: 2%;
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form_section_title{
	padding: 20px 35px;	
}
.form_section_title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}
.form_section_content{
	padding: 20px 35px;
    border-top: 1px solid #dbdde2;	
}
.form_section_content input{
	width: 98%;
    height: 25px;
    font-size: 20px;
    padding: 5px 1%;
}
.ck-content {						/* ckeditor 높이 */
    height: 170px;
}

/* 버튼 영역 */
.btn_section{
	text-align: center;
	margin: 80px 0;
}
.btn{
    min-width: 180px;
    padding: 4px 30px;
    font-size: 25px;
    font-weight: 600;
    line-height: 40px;
}
.enroll_btn{
	background-color: #dbdde2;
	margin-left:15px;
}
#enrollBtn:hover {
    background-color: #c9cbd0;
}

.form_section_content select {		/* 카테고리 css 설정 */
    width: 92%;
    height: 35px;
    font-size: 20px;
    text-align-last: center;
    margin-left: 5px;
}
.cate_wrap span {
    font-weight: 600;
}
.cate_wrap:not(:first-child) {
    margin-top: 20px;
}

#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
</style>

<body>

<div class="admin_content_main">
	<form action="/product/update" method="post" id="updateForm">
		<div class="form_section">
		<div class="form_section_title">
			<label>카테고리</label>
		</div>
		<div class="form_section_content">
			<div class="cate_wrap">
				<select name="pCateNo" value="${goodsInfo.pCateNo }">
					<option value="none" selected>=== 상품분류 ===</option>
					<option value="10">운동용품</option>
					<option value="20">보조제</option>
					<option value="30">다이어트식품</option>
				</select>
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>상품명</label>
			</div>
			<div class="form_section_content">
				<input name="pName" value="${goodsInfo.pName }">
			</div>
		</div>	
		<div class="form_section">	
			<div class="form_section_title">
				<label>상품 가격</label>
			</div>
			<div class="form_section_content">
				<input name="pPrice" value="${goodsInfo.pPrice }">
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>상세정보</label>
			</div>
			<div class="form_section_content">
				<textarea name="pDetail" id="pDetail_textarea">${goodsInfo.pDetail }</textarea>
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>재고수량</label>
			</div>
			<div class="form_section_content">
				<input name="pStock" value="${goodsInfo.pStock }">
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>상품 이미지</label>
			</div>
			<div class="form_section_content">
				<input type="file" multiple="multiple" name="pImage1" style="height: 30px;">
				<div id="uploadResult">
				</div>	
			</div>
		</div>
	</div>	
</form><br>
		
	<div class="btn_section">
      <button id="cancelBtn" class="btn">상품 목록</button>
	  <button id="modifyBtn" class="btn enroll_btn">수정 </button>
	  <button id="deleteBtn" class="btn delete_btn">삭 제</button>
	</div> 
	
	<form id="moveForm" action="/product/list" method="get" >
	<input type="hidden" name="pageNum" value="${cri.pageNum}">
	<input type="hidden" name="amount" value="${cri.amount}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
	<input type="hidden" name='prodNo' value="${goodsInfo.prodNo}">
	</form>
</div>

</body>
</html>