<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$("#goReport").click(function(){ 
	$.ajax({
		type: "post"
		,url: "/report/add"
		,data: {
				boardno:${report.boardNo}
				,category:${report.categoryNo }
			}
		,dataType: "html"
		,success: function(res){
			console.log("addReport AJAX 성공")
			alert("신고가 완료되었습니다")
			reportCheck()
			

		}
		,error: function(){
			console.log("addReport AJAX 실패")
		}
	})
})

$("#cancelReport").click(function(){ 
	if(confirm("신고를 취소하시겠습니까?")){
		$.ajax({
			type: "post"
			,url: "/report/delete"
			,data: {
				reportNo : ${report.reportNo}
				}
			,dataType: "html"
			,success: function(res){
				console.log("deleteReport AJAX 성공")
				reportCheck()
			}
			,error: function(){
				console.log("deleteReport AJAX 실패")
			}
		})
		
	}else{
		return false
	}
})

</script>
<c:choose>
	<c:when test="${report.reportNo eq 0}">
		<button type="button" id="goReport">신고하기</button>
	</c:when>
	<c:otherwise>
		<button type="button" id="cancelReport">신고취소</button>
	</c:otherwise>
</c:choose>
