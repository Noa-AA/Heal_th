<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$("#goGood").click(function(){ 
	$.ajax({
		type: "post"
		,url: "/good/add"
		,data: {
				boardno:${good.boardNo}
				,category:${good.categoryNo }
			}
		,dataType: "html"
		,success: function(res){
			console.log("addGood AJAX 성공")
			alert("좋아요 감사랑합니다")
			goodCheck()
			

		}
		,error: function(){
			console.log("addGood AJAX 실패")
		}
	})
})

$("#cancelGood").click(function(){ 
	if(confirm("좋아요를 취소 하시겠습니까?")){
		$.ajax({
			type: "post"
			,url: "/good/delete"
			,data: {
				goodNo : ${good.goodNo}
				}
			,dataType: "html"
			,success: function(res){
				console.log("cancelGood AJAX 성공")
				goodCheck()
			}
			,error: function(){
				console.log("cancelGood AJAX 실패")
			}
		})
		
	}else{
		return false
	}
})

</script>
<c:choose>
	<c:when test="${good.goodNo eq 0}">
		<button type="button" id="goGood">좋아요</button>
	</c:when>
	<c:otherwise>
		<button type="button" id="cancelGood">좋아요취소</button>
	</c:otherwise>
</c:choose>
