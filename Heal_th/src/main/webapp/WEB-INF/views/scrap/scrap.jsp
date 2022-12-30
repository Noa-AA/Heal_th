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
			
			
		}
		,error: function(){
			console.log("스크랩 불러오기 실패")
		}
	})
}

$(window).scroll(function(){
    //스크롤 이동시 작동코드
	console.log("스크롤위치",window.scrollY)
	if ($(this).scrollTop() > 300) {
      $('#goTop').fadeIn(500);
    } else {
      $('#goTop').fadeOut('slow');
    }
	
    if($('#scrapEmpty').length==0){
		if(!ajaxTrigger){
		    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight-100){
		    	console.log("테이블넘음!!")
		    	ajaxTrigger = true
		    	scrapAddListCall()
		    }
		}
    	
    }
		
});

$(document).on('click', ".scrapDelete", function() { //삭제하기
		
	console.log(".scrapDelete click")
	console.log($(this).val())
	if(confirm("스크랩을 삭제하시겠습니까?")){
		$.ajax({
			type: "post"
			,url: "/scrap/delete"
			,data: {
					scrapNo:$(this).val() //댓글번호
				}
			,context: this
			,dataType: "html"
			,success: function(scrapList){
				console.log("스크랩 삭제 성공")
				console.log($(this).val())
				$(this).attr({'disabled':true})
				var scrapCover = $("<div>").css({
											    position: "absolute",
												"background-color": "gray",
											    width: "500px",
											    height: "500px",
											    "border-radius": "20px",
											    opacity: "85%",
											    "text-align": "center",
											    "z-index": "2",
											    cursor:"default"
												})
				var coverP = $("<p>").text("삭제되었습니다")
										.css({
											"font-size": "40px",
										    "font-weight": "500",
										    color: "white",
										    opacity: "100%",
										    "margin-top": "40%"
											})
				scrapCover.append(coverP)
				$(this).parent().css("position","relative").prepend(scrapCover)
				
			}
			,error: function(){
				console.log("스크랩 삭제 실패")
			}
		})
		
	}else{
		return false
	}
})
$(document).ready(function(){
	scrapAddListCall()
	
	$("#goTop").click(()=>{
			window.scrollTo({top: 0})
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
    border-radius: 20px;
    box-shadow: 5px 5px 5px 5px #b7b7b7;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: flex-start;
}
#scrapEmpty{
	width: 1200px;
	text-align: center;
}
#scrapEnd{
	font-size: 20px;
    font-weight: 600;
	margin-top: 35px;
}
#scrapOne p{
    margin: 30px 0 10px 0;
    font-size: 15px;
}

#scrapOne a{
	font-size: 25px;
}

.scrapDelete{
	background-color: transparent;
	left: 215px;
    top: 25px;
    position: relative;
}

.scrapDeleteBtn{
	
	width: 20px;
	height: 20px;
}

#goTop{
	display: none;
	position: fixed;
	right: 70px;
	bottom: 60px;
	z-index: 9999;
	background-color: transparent;
}

.boardContent {
	margin : 50px;
}
</style>

<body>
<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">스크랩 목록</p>
	</div>
</div>
<button id="goTop"><img alt="" src="/resources/img/addOns/goTop.png" class="goTopBtn" width="50px"></button>
<div id="scrapList"></div>
</body>
<jsp:include page="../layout/footer.jsp" />
</html>