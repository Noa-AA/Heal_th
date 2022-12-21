<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$(".scrapDelete").click(function(){ //삭제하기
		console.log(".scrapDelete click")
		console.log($(this).val())
		if(confirm("스크랩을 삭제하시겠습니까?")){
			$.ajax({
				type: "post"
				,url: "/scrap/delete"
				,data: {
						scrapNo:$(this).val() //댓글번호
					}
				,dataType: "html"
				,success: function(scrapList){
					console.log("스크랩 불러오기 성공")
					//응답 데이터 출력
					$("#scrapList").html(scrapList)
				}
				,error: function(){
					console.log("스크랩 불러오기 실패")
				}
			})
			
		}else{
			return false
		}
	})
})
</script>
<style type="text/css">
#scrapList{
	border : 1px solid #ccc;
}
#scrapList th,td{
	border : 1px solid #ccc;
	
}
/* #scrapList tbody td{ */
/* 	 width:400px; */
/* } */
#scrapList tr td:nth-child(2){
	width: 350px;
}

</style>
<!-- </head> -->
<!-- <body> -->

<table id="scrapList">
<thead>
<th>게시판 명</th>
<th colspan="2" style="width:400px">제목</th>
</thead>
<tbody>
<c:forEach items="${scrapList }" var="scrap">
	<tr>
<%-- 		<td>스크랩 번호 : ${scrap.scrapNo }</td> --%>
<%-- 		<td>카테고리 번호 : ${scrap.categoryNo }</td> --%>
<%-- 		<td>카테고리 : ${scrap.categoryName } 게시판</td> --%>
<%-- 		<td>글 번호 : ${scrap.boardNo }</td> --%>
		<td style="width:200px" class="tbodytd">${scrap.categoryName } 게시판</td>
		<c:choose>
			<c:when test="${scrap.categoryNo eq 1}"> <!-- bf 게시판 -->
				<td><a href="/board/bfView?bfNo=${scrap.boardNo}"> ${scrap.title }</a></td>
			</c:when>
			<c:when test="${scrap.categoryNo eq 2}"> <!-- 운동인증 게시판 -->
				<td><a href="/board/verifyView?verifyNo=${scrap.boardNo}"> ${scrap.title }</a></td>
			</c:when>
			<c:when test="${scrap.categoryNo eq 3}"> <!-- 식단공유 게시판 -->
				<td><a href="/board/dView?dietNo=${scrap.boardNo}"> ${scrap.title }</a></td>
			</c:when>
			<c:otherwise>	<!-- 후기, 시설리뷰 게시판 -->
				<td><a href="/board/rView?reviewNo=${scrap.boardNo}"> ${scrap.title }</a></td>
			</c:otherwise>
		</c:choose>
		<td style="text-align:right"><button class="scrapDelete" value="${scrap.scrapNo}">삭제</button></td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>