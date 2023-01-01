<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="../layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/board/bfBoard"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/bfUpdate?bfNo=${viewBoard.bfNo }"
	})
	
	$("#btnDelete").click(function() {
		confirm("게시글을 정말삭제하시겠습니까?");
		location.href = "/board/bfDelete?bfNo=${viewBoard.bfNo }"
		alert("게시글이 삭제됐습니다");
	})
})
</script>

<style type="text/css">

* {
    margin: 0;
    padding: 0;
}

body{padding: 0;}

/* header <a>Tag style */

a {
    color: #000;
    text-decoration: none;
    text-decoration-line: none;
}

a:focus, a:hover {
    text-decoration: none;
    outline: none;
}


#btnList {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

#btnDelete {
    width: 100px;
    background: #616161;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 30px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

#btnUpdate {
    width: 100px;
    background: #7ca3f5;
    font-size: 21px;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 5px;
    cursor: pointer;
    padding: 10px 5px; 
    margin: 10px 5px;
    padding-bottom: 14px; 
	height: 52px;
	width: 100px;
}

.container{
	width: 1200px;
    position: relative;
    background-color: white;
    border-radius: 12px;
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 15%);
    margin: 0 auto;
}
#line{ border-top: 2px solid #ccc; }
#title{border-top: 3px solid #84C9E3; border-bottom: 3px solid #84C9E3; margin-left: 7%; width: 996px; }
</style>

<br><br><br><br><br><br><br><br>

<div class="container">
<h1 style="text-align: center; margin-top: 104px; padding-top: 26px; font-weight: bold; font-size: 40px;">Before & After 게시글</h1><br><br><br><br><br><br>

<div id="title"><br>
<div style="margin-left: 30x;">
<div style="font-size: 60px; margin-left: 20px;">📝</div>
<ul style="margin-left: 25px;">
<li style="display: none;">${viewBoard.bfNo }</li><br>
<li style="display: none;">${viewBoard.categoryNo }</li><br>
<li style="font-size: 40px; display: flex; margin-top: -125px; margin-left: 80px; padding-bottom: 3px;">${viewBoard.bfTitle }</li><br>
<li style="margin-top: -23px; margin-left: 80px;">회원번호: ${viewBoard.userNo }</li>
<li style="margin-top: -19px; margin-left: 175px;">|</li>
<li style="margin-top: -20px; margin-left: 188px;">작성일: 
<fmt:formatDate value="${viewBoard.bfInstDate }" pattern="yy-MM-dd"/>
</li>
<li style="margin-top: -20px; margin-left: 299px;">|</li>
<li style="margin-top: -20px; margin-left: 311px;">조회수: ${viewBoard.bfHit } </li>
<li style="margin-top: -20px; margin-left: 369px;">|</li>
<li style="margin-top: -20px; margin-left: 382px;">좋아요: ${viewBoard.bfThumbs }</li>
</ul><br>
</div>

</div>
<br><br><br><br>

<div style="margin-left: 9%; font-size: 30px; font-weight: 700; color: gray;">📃  게시글 내용</div>
<br><br><br>

<div style="margin-left: 130px;">
<fieldset>
	<h2 style="color:  #7ca3f5; font-weight: bold; font-size: 30px;">Before (운동 전)</h2><br><br>
	<h3 style="color: #2d4783; font-weight: 600; font-size: 25px;">운동 전 정보</h3><br>
	<div style="font-size: 20px;">신장: ${viewBoard.height}</div><br>
	<div style="font-size: 20px;">성별: ${viewBoard.gender}</div><br>
	<div style="font-size: 20px;">몸무게: ${viewBoard.weight}</div><br>
	<div style="font-size: 20px;">운동종류: ${viewBoard.bfExercise}</div>
</fieldset>
<br><br><br><br>

<fieldset>
	<h3 style="color: #2d4783; font-weight: 600; font-size: 25px;">설정 목표</h3><br>
	<div style="font-size: 20px;">목표 체중: ${viewBoard.gWeight}</div><br>
	<div style="font-size: 20px;">목표기간: ${viewBoard.sDate} ~ ${viewBoard.eDate}</div><br>
	<div style="font-size: 20px;">선택 운동: ${viewBoard.seleExercise}</div><br><br>
	<div style="font-size: 20px;">다짐글</div><br>
	<div style="font-size: 20px;">${viewBoard.beforeCon}</div>
	
</fieldset>

<br><br><br><br>

<fieldset>
	<h2 style="color: #7ca3f5; font-weight: bold; font-size: 30px;">After (운동 후)</h2><br><br>
	<h3 style="color: #2d4783; font-weight: 600; font-size: 25px;">운동 후 현재정보</h3><br>
	<div style="font-size: 20px;">몸무게: ${viewBoard.cWeight}</div><br>
	<div style="font-size: 20px;">결과: ${viewBoard.gResult}</div><br><br>
	<div style="font-size: 20px;">후기글</div><br>
	<div style="font-size: 20px;">${viewBoard.afterCon}</div>
</fieldset>
</div>
<br><br>
<hr>
<br><br>
<div style="margin-left: 9%; font-size: 30px; font-weight: 700; color: gray;">📷  이미지</div>

<br><br><br>

<div></div>

<jsp:include page="../file/file.jsp" /> <!-- 뷰페이지 사진목록 자리에 넣기 -->

<br><br><br><br>




<jsp:include page="../addOns/addOn.jsp" /> <br><br><br><br>

<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
	<c:if test="${userNo eq viewBoard.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<br><br><br><br><br><br>
<hr id="line">
<div style="border-top: 2px; solid #ccc;"></div>
<br><br>

<div style="margin-left: 9%; font-size: 30px; font-weight: 700; color: gray;">🖋️  댓글</div>

<br><br><br><br>

<jsp:include page="../comment/board.jsp" />
<br><br><br><br><br><br><br><br>
</div><!-- .container end -->

<br><br><br><br><br><br><br><br>



<%@include file="../layout/footer.jsp" %>











