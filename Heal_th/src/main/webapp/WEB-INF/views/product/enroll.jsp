<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	$("#enrollbtn").click(function(){ //등록 버튼
		$("enrollForm").submit();
	})
// 	$("#cancelbtn").click(function(){  //취소 버튼
// 		$(location).attr("href", "./list")
// 	})
	
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
	#result_card img{
		max-width: 50%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
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

<div class="adminContentMain">
	<form action="/product/enroll" method="post" id="enrollForm">
		<div class="formSection">
		<div class="formSectionTitle">
			<label>카테고리</label>
		</div>
		<div class="formSectionContent">
			<div class="cate_wrap">
				<select name="pCateNo">
					<option value="none" selected>=== 상품분류 ===</option>
					<option value="10">운동용품</option>
					<option value="20">보조제</option>
					<option value="30">다이어트식품</option>
				</select>
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품명</label>
			</div>
			<div class="formSectionContent">
				<input name="pName">
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품 가격</label>
			</div>
			<div class="formSectionContent">
				<input name="pPrice">
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상세정보</label>
			</div>
			<div class="formSectionContent">
				<input name="pDetail">
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>재고수량</label>
			</div>
			<div class="formSectionContent">
				<input name="pStock">
			</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품 이미지</label>
			</div>
			<div class="formSectionContent">
				<input type="file" multiple="multiple" name="pImage1" style="height: 30px;">
				<div id="uploadResult">
<!-- 					<div id="result_card"> -->
<!-- 						<div class="imgDeleteBtn">X</div> -->
<!-- 						<img src="/product/display?fileName=gg.jpg"> -->
<!-- 					</div>					 -->
				</div>
			</div>
		</div>
	<div class="btnSection">
		<button id="enrollbtn">등록</button>
		<button id="cancelbtn"><a href="./list">취소</a></button>
	</div>
	</form><br>
</div>


</body>
</html>