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
// 			goodCheck()
			location.reload()
			

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
// 				goodCheck()
				location.reload()
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
	<c:when test="${good.goodNo eq 0}"><!-- 좋아요 -->
		<button type="button" id="goGood"><img src="/resources/img/addOns/goodNo.png" alt="goodNo"></button>
	</c:when>
	<c:otherwise><!-- 좋아요취소 -->
		<button type="button" id="cancelGood"><img src="/resources/img/addOns/goodOk.png" alt="goodOk"></button>
	</c:otherwise>
</c:choose>
