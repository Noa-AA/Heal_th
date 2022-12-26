<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 업로드</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
#imageUp{
display: none;
}
</style>
</head>
<body>
<h1>사진 업로드창</h1>
<hr>
<button id="fileUpload" onclick="fileup()">파일 올리기</button>
<button id="fileDelete" onclick="filede()">파일 지우기</button>
<input type="file" id="imageUp" accept="image/*" onchange="setPreview(event)" multiple/><br><br>
<div id="imgContainer"><a></a></div>
<script>
var filede = () =>{
	$(".imgs").remove()
// 	$(".imgs").empty()
}
var fileup =() =>{
	console.log("fileupclick")
	$("#imageUp").click()
}
function setPreview(event) {
// 	$("#imgContainer").empty()
	
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
			var img = $('<a>').attr("href","javascript:void(0)").attr("onclick","removeImg("+i+",have)").attr("id","img"+ i ).addClass( "imgs" )
					.append($('<img>').attr("src",event.target.result).css('width', '100px'))
					
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
var have = () =>{
	if($(".imgs").length){
		console.log("있음")
	}else{
		console.log("없음")
	}
	
}
var removeImg = (i,have)=>{
	console.log(i+1,"번째 이미지 클릭")
	var img = "#img"+i
	$(img).remove()
	have()
// 	console.log($("#imgContainer"))
}

</script>
</body>
</html>