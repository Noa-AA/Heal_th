<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/header.jsp" />


<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	vertical-align: center;
	height:80px;
}

tr{
height:50px;
}

#btnWrite {
    background: #7474BF;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #7ca3f5, #c583d6);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #7ca3f5, #c583d6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    color: #fff;
	border: none;
	font-weight: bold;
	width: 60px;
	height: 34px;
	float: right;
	margin-top: -28px;
}

.myform{
    display: inline-block;
    direction: rtl;
    border:0;
}
.myform legend{
    text-align: right;
}
.myform input[type=radio]{
    display: none;
}
.myform label{
    font-size: 3opx;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}

/*
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
*/
.myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

span{display: none;}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/rWrite")
	})

	$(".myform").each(function() {
		var score = $(this).find(".myratings").text()
// 		console.log(score)
	 	$(this).find( "input[name^='score'][value='"+score+"']" ).prop("checked", true)
// 	     console.log( $(this).find( "input[name^='score'][value='"+score+"']" ) )
// 	 	console.log($(this).find('.myratings'))
	     if (score<3) {
	         $(this).find('.myratings').css('color','red'); 
	         $(this).find('.myratings').text(score);
	 	}else{
	 		$(this).find('.myratings').css('color','green');
	  	  	$(this).find('.myratings').text(score);
	 	}
	});	
})

</script>







<div class="container">

<h1>게시판 리스트</h1><br><br>

<h3>헬스장 후기 게시판</h3>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center"> 
        	<button type="button" id="btnWrite" class="btn btn-warning btn-icon-text animatebutton"> <i class="fa fa-check btn-icon-prepend"></i>글쓰기</button> 
       </div>
    </div>
</div>


<!-- <button id="btnInsert">글쓰기</button> -->


<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 15%;">별점</th>
		<th style="width: 35%;">제목</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 10%;">좋아요</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.reviewNo }</td>
		<td class="myform">
			<span class="myratings">${board.score }</span>
			<input type="radio" name="score${board.reviewNo }" value="5.0" id="rate1"><label for="rate1">★</label>
			<input type="radio" name="score${board.reviewNo }" value="4.0" id="rate2"><label for="rate2">★</label>
			<input type="radio" name="score${board.reviewNo }" value="3.0" id="rate3"><label for="rate3">★</label>
			<input type="radio" name="score${board.reviewNo }" value="2.0" id="rate4"><label for="rate4">★</label>
			<input type="radio" name="score${board.reviewNo }" value="1.0" id="rate5"><label for="rate5">★</label>
		</td>
		<td><a href="${path}/board/rView?reviewNo=${board.reviewNo}">${board.rTitle }</a></td>
		<td>${board.userNo }</td>
		<td>${board.rHit }</td>
		<td>${board.rThumbs }</td>
		<td><fmt:formatDate value="${board.rInstDate }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/board/paging.jsp" />

</div><!-- .container -->


