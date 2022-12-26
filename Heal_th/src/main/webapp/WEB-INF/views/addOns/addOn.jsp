<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
function scrapCheck(){
	$.ajax({
		type: "post"
		,url: "/scrap/check"
		,data: {
				boardno:${boardNo}
				,category:${viewBoard.categoryNo }
			}
		,dataType: "html"
		,success: function(scrap){
			console.log("scrapCheck AJAX 성공")
			$("#scrapContainer").html(scrap)
		}
		,error: function(){
			console.log("scrapCheck AJAX 실패")
		}
	})
}
function reportCheck(){
	$.ajax({
		type: "post"
		,url: "/report/check"
		,data: {
				boardno:${boardNo}
				,category:${viewBoard.categoryNo }
			}
		,dataType: "html"
		,success: function(report){
			console.log("reportCheck AJAX 성공")
			$("#reportContainer").html(report)
		}
		,error: function(){
			console.log("reportCheck AJAX 실패")
		}
	})
}

function goodCheck(){
	$.ajax({
		type: "post"
		,url: "/good/check"
		,data: {
				boardno:${boardNo}
				,category:${viewBoard.categoryNo }
			}
		,dataType: "html"
		,success: function(good){
			console.log("goodCheck AJAX 성공")
			$("#goodContainer").html(good)
		}
		,error: function(){
			console.log("goodCheck AJAX 실패")
		}
	})
}

$(document).ready(function(){
	scrapCheck()
	reportCheck()
	goodCheck()
	
})
</script>
<style>
#addOnsContainer{
    width: 300px;
    display: flex;
    margin: 0 auto;
    margin-bottom: 50px;
    justify-content: space-between;
}
#addOnsContainer button{
	background-color: transparent;
}
#addOnsContainer button img{
	 width : 70px;
	 height : 70px;	
}
</style>

<div id="addOnsContainer">
	<div id="scrapContainer"></div>
	<div id="reportContainer"></div>
	<div id="goodContainer"></div>

</div>
