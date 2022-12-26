<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
function commentListCall() {
	$.ajax({
		type: "get"
		,url: "/comment/list"
		,data: {
				boardno:${boardNo}
				,category:${viewBoard.categoryNo }
			}
		,dataType: "html"
		,success: function(commentList){
			console.log("댓글불러오기")
			//응답 데이터 출력
			$("#commentList").html(commentList)
		}
		,error: function(){
			console.log("AJAX 실패")
		}
	})
}

$(document).ready(function(){

	
	commentListCall(${boardNo}	,${viewBoard.categoryNo })
	
	 $('#content').focus( ()=>{
		console.log("입력창 포커스") 
		
		var sessionData = <%=session.getAttribute("userNo")%>
		if(null==sessionData || !sessionData){// 로그인 안됐을경우
			console.log("state : logout")
			if(confirm("로그인이 필요합니다\n로그인페이지로 이동하시겠습니까?")){
				 $('#content').blur()
				location.replace('/login/login') //로그인 페이지 이동
				
			}else{
				$('#content').blur()
				return false
			}
		}else{
			return true
		}
	 })
	
	
	$("#write").click(function(){ //작성하기
		console.log("#write click")
		
		if ( $('#content').val()=='' ) {
			alert("내용을 입력하세요.")
			return false
		}
		$.ajax({
			type: "post"
			,url: "/comment/insert"
			,data: {
					content:$("#content").val() //댓글내용
					,boardno:${boardNo}					// 글번호
					,category:${viewBoard.categoryNo }					// 글 카테고리
				}
			,dataType: "html"
			,success: function(commentList){
				console.log("AJAX 성공")
				$("#content").val("")
				
				
				//응답 데이터 출력
// 				$("#commentList").html(commentList)
				commentListCall()
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
<style>
#inputContainer{
	text-align: center;
	padding-bottom: 20px;
}
#content{
	width: 90%;
	height: 50px;
}
#write{
	height: 50px;
	width: 50px;
}

#commentBoard{
    margin: 0 auto;
	width: 700px;
	background-color: aliceblue;
}

#commentList{
    padding: 20px 20px 0 20px;
    width: 100%;
}

#commentListTable {
	border: 10px #ccc;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	
}

#commentSpace {
	height: 10px;
}

.commentOne {
	margin-bottom: 50px;
}

.pIcon {
	width: 70px;
	height: 70px;
	border-radius: 71px;
}

/*  #commentListTable tr,td{  */
/*  	border: solid 1px #ccc;  */
/*  }  */
.userNick {
	font-weight: 900;
}

.commentContent {
	background-image: url("/resources/img/addOns/sb.png");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
    padding-left: 30px;
}

.commentDelete {
	cursor:pointer;
	width: 20px;
	height: 20px;
}
</style>

<div id="commentBoard">

<div id="commentList"></div> <!-- 댓글 List 적용될 div -->
<br>
<div id="inputContainer">
<form action="./insert"> <!-- 댓글 입력 폼 -->
<input type="text" name="content" id="content" placeholder="내용을 입력하세요">
<button disabled="disabled" style="display: none;"></button>
<button type="button" id="write">작성</button>
</form>
</div>

</div>  <!-- End commentBoard --> 

<!-- </html> -->