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
}

#btnInsert {
    background: #7474BF;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #348AC7, #7474BF);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #348AC7, #7474BF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    color: #fff;
	border: 3px solid #eee; 
	
	width: 60px;
	height: 34px;
}

.btn {
    margin-right: 0.5rem !important
}

.btn {
    font-size: 0.875rem;
    line-height: 1;
    font-weight: 400;
    padding: .7rem 1.5rem;
    border-radius: 0.1275rem
}

.container {
    margin-top: 100px
}

.toast {
    transition: 0.32s all ease-in-out
}

.toast-container--fade {
    right: 0;
    bottom: 0
}

.toast-container--fade .toast-wrapper {
    display: inline-block
}

.toast.fade-init {
    opacity: 0
}

.toast.fade-show {
    opacity: 1
}

.toast.fade-hide {
    opacity: 0
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnInsert").click(function() {
		
		const element =  document.querySelector('.btnInsert');
        element.classList.add('animated', 'pulse');
        setTimeout(function() {
          element.classList.remove('pulse'); 
  },        1000);
		
		$(location).attr("href", "/board/bf_write")
	})
	
})

</script>







<div class="container">

<h1>게시판 리스트</h1><br><br>

<h3>비포 애프터 게시판</h3>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center"> <button type="button" id="btnInsert" class="btn btn-warning btn-icon-text animatebutton"> <i class="fa fa-check btn-icon-prepend"></i>글쓰기</button> </div>
    </div>
</div>


<!-- <button id="btnInsert">글쓰기</button> -->


<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 15%;">카테고리</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.bf_no }</td>
		<td>${board.category_no }</td>
		<td><a href="${path}/board/detail?no=${board.bf_no}">${board.bf_title }</a></td>
		<td>${board.user_no }</td>
		<td>${board.bf_hit }</td>
		<td>${board.bf_thumbs }</td>
		<td><fmt:formatDate value="${board.bf_inst_date }" pattern="yy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/board/paging.jsp" />

</div><!-- .container -->


