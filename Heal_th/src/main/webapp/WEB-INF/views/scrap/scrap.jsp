<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var ajaxTrigger = false
function scrapAddListCall() {
	$.ajax({
		type: "get"
		,url: "/scrap/addlist"
		,data: {
			}
		,async: false
		,dataType: "html"
		
		,success: function(scrapAddList){
			console.log("스크랩 불러오기 성공")
			//응답 데이터 출력
			$("#scrapList").append(scrapAddList)
			ajaxTrigger = false
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
						}
						,error: function(){
							console.log("스크랩 불러오기 실패")
						}
					})
					
				}else{
					return false
				}
			})
		}
		,error: function(){
			console.log("스크랩 불러오기 실패")
		}
	})
}

$(window).scroll(function(){
    //스크롤 이동시 작동코드
    if($('#scrapEmpty').length==0){
		console.log("스크롤위치",window.scrollY)
		if(!ajaxTrigger){
		    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight-100){
		    	console.log("테이블넘음!!")
		    	ajaxTrigger = true
		    	scrapAddListCall()
		    }
		}
    	
    }
		
});
	
$(document).ready(function(){

console.log($(".footer-wrap").offset().top)
console.log($("#scrapList").height())
// 	scrapListCall()

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
// 				$("#scrapList").html(scrapList)
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
	width: 1200px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 0 auto;
}
#scrapOne{
	height: 500px;
    width: 500px;
    background-color: ghostwhite;
    margin: 30px;
}
#scrapEmpty{
	width: 1200px;
	text-align: center;
}
</style>

<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">스크랩 목록</p>
	</div>
</div>
<div id="scrapList">
	<c:forEach items="${scrapList }" var="scrap">
		<div id="scrapOne">
			<span>${scrap.categoryName } 게시판</span>
				<c:choose>
					<c:when test="${scrap.categoryNo eq 1}"> <!-- bf 게시판 -->
						<a href="/board/bfView?bfNo=${scrap.boardNo}"> ${scrap.title }</a>
					</c:when>
					<c:when test="${scrap.categoryNo eq 2}"> <!-- 운동인증 게시판 -->
						<a href="/board/verifyView?verifyNo=${scrap.boardNo}"> ${scrap.title }</a>
					</c:when>
					<c:when test="${scrap.categoryNo eq 3}"> <!-- 식단공유 게시판 -->
						<a href="/board/dView?dietNo=${scrap.boardNo}"> ${scrap.title }</a>
					</c:when>
					<c:otherwise>	<!-- 후기, 시설리뷰 게시판 -->
						<a href="/board/rView?reviewNo=${scrap.boardNo}"> ${scrap.title }</a>
					</c:otherwise>
				</c:choose>
				<button class="scrapDelete" value="${scrap.scrapNo}">삭제</button>
		</div>
	</c:forEach>
</div>
</body>
<jsp:include page="../layout/footer.jsp" />
</html>