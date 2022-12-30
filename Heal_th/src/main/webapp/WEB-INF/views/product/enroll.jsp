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
	
	let enrollForm = $("#enrollForm")
	
	$("#cancelBtn").click(function(){ //취소 버튼
	
		location.href="/product/list"
	
	});
	
	$("#enrollbtn").on(function(){ //등록 버튼
		e.preventDefault();
	
		enrollForm.submit();
		
	});


	/* 이미지 업로드 */
	$("input[type='file']").on("change",function(e){ 
		
		//이미지 존재시 삭제
		if($(".imgDeleteBtn").length>0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="pImage1"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
// 		alert("통과");
		
		for(let i = 0; i < fileList.length; i++){ 
			formData.append("pImage1", fileList[i]);
		}

		$.ajax({
			url:'/product/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function (result) {
				console.log(result);
				showUploadImage(result);
			},
			error : function (result) {
				alert("이미지 파일이 아닙니다.")
			}
		});
		
	})
	
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB
	function fileCheck(fileName, fileSize) {
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과!!");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	/* 이미지 출력*/
	function showUploadImage(uploadResultArr) {
		//데이터 검증
		if(!uploadResultArr || uploadResultArr.length == 0){
			return
		}
		
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		let str = "";
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";
		
		uploadResult.append(str);
		
	}
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function (e) {
		deleteFile();
	})
	
	/* 이미지 파일 삭제 */
	function deleteFile() {
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/product/deleteFile',
			data: {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function (result) {
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function (result) {
				console.log(result);
				
				alert("파일을 삭제하지 못했습니다.")
			}
		})
	}
	

	

})
</script>

<style type="text/css">
.ck-content {						/* ckeditor 높이 */
    height: 170px;
}
.admin_content_wrap{
	height: 700px;
	overflow: scroll;
}
/* 관리자 컨텐츠 메인 영역 */
.form_section{
/* 	width: 95%; */
/*     margin-left: 2%; */
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}
.form_section_title{
/* 	padding: 20px 35px;	 */
}
.form_section_title label{
	display: block;
    font-size: 20px;
    font-weight: 800;
}
.form_section_content{
/* 	padding: 20px 35px; */
    border-top: 1px solid #dbdde2;	
}
.form_section_content input{
	width: 98%;
    height: 25px;
    font-size: 20px;
    padding: 5px 1%;
}
.form_section_content select{
	width: 98%;
    height: 35px;
    font-size: 20px;
    text-align-last: center;
}

/* 상위 div 수정 */

#formbox {
	width: 1200px;
	height: 800px;
	position: relative;
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

<div class="admin_content_wrap">
 <div class="admin_content_subject"><span>상품 등록</span></div>
	<div class="admin_content_main">
	<form action="/product/enroll" method="post" id="enrollForm">
		<div class="form_section" id="formbox">
			<div class="form_section_title">
				<label>카테고리</label>
			</div>
		<div class="form_section_content">
			<div class="cate_wrap">
				<select name="pCateNo">
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
				<input name="pName">
			</div>
		</div>	
		<div class="form_section">	
			<div class="form_section_title">
				<label>상품 가격</label>
			</div>
			<div class="form_section_content">
				<input name="pPrice" value="0">
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>상세정보</label>
			</div>
			<div class="form_section_content">
				<textarea name="pDetail" id="pDetail_textarea"></textarea>
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>재고수량</label>
			</div>
			<div class="form_section_content">
				<input name="pStock" value="0">
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
	<div class="btn_section">
		<button id="enrollBtn" class="btn">등록</button>
		<button id="cancelBtn" class="btn">취소</button>
	</div>
	</form><br>
</div>
</div>

</body>
</html>