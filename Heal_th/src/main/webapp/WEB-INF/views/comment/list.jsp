<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

$(document).ready(function(){
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
// 				$("#commentBoard").html(commentList)
				commentListCall(1, 1)
			}
			,error: function(){
				console.log("AJAX 실패")
			}
		})
	})
})
</script>
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