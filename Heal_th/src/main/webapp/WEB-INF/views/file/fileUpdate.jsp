<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#imageUp{
display: none;
}
#imgContainer{
/* 	width: 500px; */
	display: flex;
    text-align: center;
	flex-wrap: wrap;
}
.deleteBtn{
	background-color: transparent;
	border: 0;
    position: absolute;
    cursor: pointer;
}
.deleteBtnImg {
	width: 20px;
	height: 20px;
	left: 20px;
    top: -100px;
    position: relative;
	filter: drop-shadow(0px 0px 1px gray);
}
</style>
<script type="text/javascript">
function updateListCall() {
	$.ajax({
		type: "get"
		,url: "/file/updateList"
		,data: {
			boardNo:${boardNo}
			,category:${categoryNo }
			}
		,dataType: "html"
		,success: function(List){
			console.log("사진 불러오기 AJAX 성공")
			//응답 데이터 출력
			$("#imgContainer").html(List)
			
			$(".deleteBtn").click(function(){
		console.log("지우기")
		$(this).parent().remove()
		
	})
		
		}
		,error: function(){
			console.log("사진 불러오기 AJAX 실패")
		}
	})
}
$(document).ready(function(){
	updateListCall()

})
</script>

<form action="/file/update" method="post" enctype="multipart/form-data">
<button type="button" id="fileUpload" onclick="fileup()">사진 추가</button>
<div id="imgContainer"></div>
<input type="file" id="imageUp" name="multiFile" accept="image/*" onchange="setPreview(event)" multiple/><br><br>
<button>수정완료</button>
</form>
${pageContext.request.contextPath}
<script type="text/javascript">
function setPreview(event) {
	console.log("올리기")
	var imgs 
	imgs = event.target.files
	var imgsArr = Array.prototype.slice.call(imgs)
	
	imgsArr.forEach(function(f,i){
		if(!f.type.match("image.*")){
			alert("이미지 확장자만 가능합니다.")
			return
		}
		
		var reader = new FileReader();
	    reader.onload = function(event){
	    	var img = $('<img>').attr("src",event.target.result).css('width', '100px').css("height","100px")
			var div = $('<div>')
			$(div).append($(img))
			$(div).append('<br><button type="button" class="deleteBtn"><img alt="" src="/resources/img/addOns/delete.png" class="deleteBtnImg"></button>')
			
			$(div).appendTo("#imgContainer")
			
			$(".deleteBtn").click(function(){
			console.log("지우기")
			$(this).parent().remove()
		
	})
		    }
	    reader.readAsDataURL(f)
		
	})
    
    
}
var fileup =() =>{
	console.log("fileupclick")
	$("#imageUp").click()
}

</script>
