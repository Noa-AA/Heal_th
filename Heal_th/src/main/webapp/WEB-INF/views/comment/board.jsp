<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#write").click(function(){ //작성하기
		console.log("#ajax click")
		
		$.ajax({
			type: "post"
			,url: "/comment/insert"
			,data: {
					content:$("#content").val() //댓글내용
					,boardno:1					// 글번호
					,category:1					// 글 카테고리
				}
			,dataType: "html"
			,success: function(commentList){
				console.log("AJAX 성공")
				$("#content").val("")
				
				
				//응답 데이터 출력
				$("#commentBoard").html(commentList)
			}
			,error: function(){
				console.log("AJAX 실패")
			}
		})
	})
	
	$(".commentDelete").click(function(){ //삭제하기
		console.log(".commentDelete click")
		console.log($(this).val())
		
		$.ajax({
			type: "post"
			,url: "/comment/delete"
			,data: {
					commentno:$(this).val() //댓글번호
					,boardno:1					// 글번호
					,category:1					// 글 카테고리
				}
			,dataType: "html"
			,success: function(commentList){
				console.log("AJAX 성공")
				
				
				//응답 데이터 출력
				$("#commentBoard").html(commentList)
			}
			,error: function(){
				console.log("AJAX 실패")
			}
		})
	})
	
	$("#content").on("keyup",function(key){ // 입력창 엔터시 작성하기버튼 클릭
	    if(key.keyCode==13) {
	    	$("#write").click()
	    }
	})
})


</script>
<style type="text/css">
table{
	border: solid 1px #ccc;
}
</style>
</head>
<body>
<div id="commentBoard">
<h1>댓글창</h1>
<hr>
새<br>로<br>고<br>침<br>확<br>인<br>용<br>
새<br>로<br>고<br>침<br>확<br>인<br>용<br>
새<br>로<br>고<br>침<br>확<br>인<br>용<br>
새<br>로<br>고<br>침<br>확<br>인<br>용<br>

댓글 list<br>
<div id="commentList">
<table id="commentListTable">
<c:forEach items="${commentList }" var="comment">
	<tr>
		<td>댓글번호 : ${comment.commentNo }</td>
		<td>댓글내용 : ${comment.commentContent }</td>
		<td>작성자 : ${comment.userNick }</td>
		<td>작성일 : <fmt:formatDate value="${comment.commentDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td><button class="commentDelete" value="${comment.commentNo}">삭제</button></td>
<%-- 		<td><a href="${comment.commentNo}">삭제</a></td> --%>
	</tr>
</c:forEach>
</table>
</div>
<div id="test"></div>
<hr>

<form action="./insert">

<input type="text" name="content" id="content" placeholder="내용을 입력하세요"><br>
<button disabled="disabled" style="display: none;"></button>
<button type="button" id="write">작성하기</button>

</form>
</div>
</body>
</html>