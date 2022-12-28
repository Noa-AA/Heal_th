<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$("#goScrap").click(function(){ 
	$.ajax({
		type: "post"
		,url: "/scrap/add"
		,data: {
				boardno:${scrap.boardNo}
				,category:${scrap.categoryNo }
			}
		,dataType: "html"
		,success: function(res){
			console.log("addScrap AJAX 성공")
			
			if(confirm("글이 저장되었습니다\n스크랩 목록으로 이동하시겠습니까?")){
				location.replace('/scrap/scrap') //스크랩목록 페이지 이동
				
			}else{
				scrapCheck()
				return false
			}

		}
		,error: function(){
			console.log("addScrap AJAX 실패")
		}
	})
})

$("#cancelScrap").click(function(){ 
	if(confirm("스크랩을 삭제하시겠습니까?")){
		$.ajax({
			type: "post"
			,url: "/scrap/delete"
			,data: {
					scrapNo : ${scrap.scrapNo}
				}
			,dataType: "html"
			,success: function(res){
				console.log("cancelScrap AJAX 성공")
				scrapCheck()
			}
			,error: function(){
				console.log("cancelScrap AJAX 실패")
			}
		})
		
	}else{
		return false
	}
})

</script>
<c:choose>
	<c:when test="${scrap.scrapNo eq 0}"><!-- 스크랩하기 -->
		<button type="button" id="goScrap"><img src="/resources/img/addOns/scrapNo.png" alt="scrapNo"></button>
	</c:when>
	<c:otherwise><!-- 스크랩취소 -->
		<button type="button" id="cancelScrap"><img src="/resources/img/addOns/scrapOk.png" alt="scrapOk"></button>
	</c:otherwise>
</c:choose>
