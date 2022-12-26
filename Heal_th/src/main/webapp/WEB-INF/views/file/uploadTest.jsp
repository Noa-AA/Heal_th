<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<form action="./write" method="post" enctype="multipart/form-data">
<button type="button" id="fileUpload" onclick="fileup()">사진 올리기</button>
<input type="file" id="imageUp" name="multiFile" accept="image/*" onchange="setPreview(event)" multiple/><br><br>
<div id="imgContainer"></div>
<button>작성</button>
</form>
<style type="text/css">
#imageUp{
display: none;
}
</style>
<script type="text/javascript">
function setPreview(event) {
	$("#imgContainer").empty()
	
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
			var img = $('<img>').attr("src",event.target.result).css('width', '100px')
					
// 	    	$("#imgContainer").append('<img src="' + event.target.result + '" />');

// 			var img = $('<img>').attr("src",event.target.result).css('width', '100px')
					
		      $(img).appendTo("#imgContainer")
		    }
	    reader.readAsDataURL(f)
		
	})
    
    
// 	var reader = new FileReader();
//     reader.onload = function(e){
//     	console.log($("#imgPreview"))
//       $("#imgPreview").attr("src",e.target.result).css('width', '100px')
//       .css('height', '100px');
//     }
//     reader.readAsDataURL(event.target.files[0])
}
var fileup =() =>{
	console.log("fileupclick")
	$("#imageUp").click()
}
</script>
</body>
</html>