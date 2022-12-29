<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<jsp:include page="../layout/header.jsp" />


<style type="text/css">

#twoDepth-list a {
	padding: 10px;
	display: flex;
    align-items: center;
    justify-content: center;
    color: #666666;
    font-size: 18px;
    font-weight: 400;
    width: 20%;
}

#twoDepth-list a:nth-child(2) {
    color: #b571e9;
    border-bottom: 2px solid #b571e9;
    margin-top: 1px;
    font-weight: 700;
}



/* body css */

body{
	font-family: 'Noto Sans','NotoSansWeb',Verdana,"맑은 고딕",Malgun Gothic,Dotum,돋움,Gulim,굴림,sans-serif;
	margin: 0;
	padding: 0;
}


#container{ width: 1200px;}

#btnWrite {
    background: #7ca3f5;
    color: #fff;
	border: none;
	border-radius: 7px;
	font-size: 22px;
	font-weight: bold;
	width: 132px;
	height: 50px;
	float: right;
/* 	margin-top: -104px; */
	display: block;
}

#totalList {
    color: #7ca3f5;
	text-decoration: none;	
	font-weight: bold;
	width: 120px;
	height: 34px;
	float: right;
    margin-top: 15px;
	
}

#search { text-align: center; margin-bottom: -5px; }

#type{
/* 	border: 2px solid #7ca3f5; */
/* 	font-weight: border; */
/* 	display: none; */
width: 100px;
	height: 40px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding: 8px 12px;
	outline: none;
	margin-right: 4px;
    font-size: 13px;
    font-weight: 500;
    color: #666;
}

#searchText{
	width: 360px;
	padding: 0 6px;
	border: 2px solid #7ca3f5;
	border-radius: 30px;
	transition: 0.4s;
	padding-top: 8px;
	padding-bottom: 8px;
}

#searchText:hover{
  box-shadow: 0px 0px .5px 1px #7ca3f5;
  width: 380px;
}

#searchIcon{
 margin-left: -39px;
  width: 30px;
  height: 30px;
  background-color: #fff;
  color: #7ca3f5;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  border: none;
}

/* 페이징 부분 */
.text-center {
	display: flex;
	justify-content: center; 
	margin-top: 50px;
}

.pagination {
	display: flex;
	margin: 0;
}

.pagination > li{
	display: flex;
}

.pagination > li > a {
	display: flex;
	margin: 0 4px;
	width: 40px;
	height: 40px;
	border-radius: 20px !important;
	font-size: 16px;
	justify-content: center;
	align-items: center;
	color: #7ca3f5;
}

.none:hover {
	cursor: default;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	background-color: #7ca3f5;
    border-color: #7ca3f5;
}


.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 48
}


/* 공지사항 / 게시글 내용 */
#noticeStrong{
	background: #ff4057;
    font-weight: bold;
    color: white;
    padding-top: 4px;
    padding-bottom: 4px;
    padding-right: 10px;
    padding-left: 10px;
    border-radius: 16px;
    font-size: 18px;
}

#article ul{
	display: block;
	margin: 0;
    padding: 0;
    line-height: 4;
    border-bottom: 1px solid #ccc;
}


#searchResult:hover{ background-color: #F7F7F7; }

#boardUrl{ font-size: 20px; font-weight: bold; }

.ellipsis {
	color:#666;
	font-weight: 600;
	display:-webkit-box;
	-webkit-box-orient:vertical;
	overflow:hidden;
	-webkit-line-clamp:1;
}

#pIcon{display: block; width: 14px; margin-right:8px; margin-top: 20px;}

#thumbnail{border-radius: 10px; width: 259px; height: 150px; margin-top: -113px; }

#imgNone{display: none;}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	let moveForm = $("#moveForm");
	$(".move")
		.on(
			"click",
			function(e) {
				e.preventDefault();
				moveForm.empty();

				moveForm
						.append("<input type='hidden' name='bfNo' value='"
								+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/board/searchView");
				moveForm.submit();
			});
	
	//페이지 이동 번호 동작
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();

		moveForm.find("input[name='curPage']").val($(this).attr("href"));
		moveForm.attr("action", "/board/bfBoard");
		moveForm.submit();

	});



	//검색 버튼
	$(".search_area button").on("click", function(e) {
		e.preventDefault();

		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();

		if (!keyword) {
			alert("키워드를 입력하세요.");
			return false;
		}

		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='curPage']").val(1);
		moveForm.submit();
	});
	
	
	//검색창 엔터시 검색 기능 
	$("#searchText").keydown(function (key) {
		if (key.keyCode == 13) {
			 
            // 엔터키가 눌렸을 때 실행할 내용
			$("#searchIcon").click();
       }
	})
	
	
	//게시글 작성 버튼
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/bfWrite")
	})
	
	//2Depth 메뉴 버튼
	 $(".tab_menu li").click(function () {
	        var $this = $(this),
	            tabId = $this.data("tab"),
	            tabIndex = $this.index();

	        $(".tab_menu li").removeClass("on");

			$this.addClass("on");
	        $("#"+tabId).addClass("on");

	    });

})


</script>


<div id="subvisual">
	<div id="subvisual-A">
		<p id="subv-title">커뮤니티</p>
	</div>
</div>
<div id="twoDepth">
	<div id="twoDepth-list">
		<a href="/board/boardList">소개</a>
		<a href="/board/bfBoard">비포 애프터</a>
		<a href="/board/verifyBoard">운동 인증</a>
		<a href="/board/dietBoard">식단 공유</a>
		<a href="/board/reviewBoard">시설 후기</a>
	</div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



<div class="container" id="container">

<div id="boardList">
	<h3 style="font-weight: bold; margin-bottom: 37px; color: #06364E; font-size: 50px;">비포 애프터 게시판</h3>
</div>



<div class="beforeafter" id="search" name="search">

<form action="/board/bfBoard" method="get">
	<div class="search_wrap">
		<div class="search_area" style="margin-left: 665px;">
			<select name="type" id="type" style="display: inline-block; margin-right: 15px;
    display: inline-block;">
				<option value="T" <c:out value="${pageMaker.boardSearch.type eq 'T'?'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.boardSearch.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="TC" <c:out value="${pageMaker.boardSearch.type eq 'TC'?'selected':'' }"/>>제목+내용</option>
			</select> 
			
				
				<input id="searchText" type="text" name="keyword" value="${pageMaker.boardSearch.keyword }" placeholder="search...">
					<button id="searchIcon"><i class="fas fa-search"></i></button>
		</div>
	</div>
</form>

<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">

				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a href="${pageMaker.startPage - 1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.boardSearch.curPage == num ? "active":"" }"></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>

			</ul>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" id="bfNo" name="bfNo" value='<c:out value="${pageInfo.bfNo}"/>'>
		<input type="hidden" name="curPage" value="${pageMaker.boardSearch.curPage }">
		<input type="hidden" name="amount" value="${pageMaker.boardSearch.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.boardSearch.keyword }">
		<input type="hidden" name="type" value="${pageMaker.boardSearch.type }">
	</form>

</div>



<div>
   	<a href="/board/bfBoard" id="totalList" name="totalList" style="float: left; margin-top: -25px;">전체 게시글 보기 ▼</a>
</div>



<div id="article" style="border-top: 3px solid #84C9E3; margin-top: 22px;">
<c:forEach items="${notice}" var="notice">
	<ul id="noticeUl" style="list-style: none; line-height: 3;">
		<li style="float: left; margin-right: 100px; display: inline;"><strong id="noticeStrong">공지</strong></li>
		<li style="font-size: 18px; display: inline;"><a href="/notice/view?noticeNo=${notice.noticeNo}&noticeNo=3&"><strong>${notice.noticeTtl }</strong></a></li>
		<li style="float: right; margin-top: 7px; display: inline;">작성일 <fmt:formatDate value="${notice.noticeDate }" pattern="yy-MM-dd" /></li>
		<li style="float: right; margin-top: 7px; margin-right: 8px; display: inline;" >|</li>
		<li style="float: right; margin-top: 7px; margin-right: 8px; display: inline;">조회수 ${notice.noticeHit }</li>
		<li style="float: right; margin-top: 7px; margin-right: 8px; display: inline;" >|</li>
		<li style="float: right; margin-top: 7px; margin-right: 8px; display: inline;"><strong style="color: #0D71A4;">관리자</strong></li>
		<li style="display: none;" ></li><br>
<!-- 		<li style="float: left; margin-right: 20px;"><strong style="color: #0D71A4;">공지</strong></li> -->
	</ul>
		
</c:forEach>

<!-- 일반 게시글 / 검색결과 -->
<c:forEach items="${boardSearch }" var="boardSearch">
	<ul id="searchResult" style="list-style: none;">
		<li style="float: left; display: none;" >${boardSearch.bfNo }</li>
		<li style="float: left; line-height:380%;"><a href="${path}/board/bfView?bfNo=${boardSearch.bfNo}" id="boardUrl">${boardSearch.bfTitle }</a></li><br>
		<li style="float: left;" class="ellipsis" >${boardSearch.afterCon }</li><br>
		
		<li style="float: right;">
		
			<c:set var="fileSto" value="${null }"/>
			<c:forEach items="${fileMapList }" var="fileMap">
			<c:if test="${fileMap.bfNo eq boardSearch.bfNo}">
				<c:set var="fileSto" value="${fileMap.fileList[0].fileSto }"/>
			</c:if>
			</c:forEach>
			<c:if test="${fileSto == null}">
				<img id="imgNone">
			</c:if>	
			<c:if test="${fileSto != null}">
				<img src="${pageContext.request.contextPath}/upload/${fileSto }" id="thumbnail">
			</c:if>		
			
		</li>
		
		<li style="float: left;" >
			<c:if test="${storedName == null }">
				<img src="/resources/img/mypage/userprofile.png" class="pIcon" id="pIcon">
			</c:if>
			<c:if test="${storedName != null}">
				<img src="${pageContext.request.contextPath}/upload/${storedName.storedName}" class="pIcon" id="pIcon">
			</c:if>
		</li>
		<li style="float: left; margin-right: 8px;" ><strong style="color: #0D71A4;">${boardSearch.userNo }</strong></li>
		<li style="float: left; margin-right: 8px;" >|</li>
		<li style="float: left; margin-right: 8px;" >작성일 <fmt:formatDate value="${boardSearch.bfInstDate }" pattern="yy-MM-dd"/></li>
		<li style="float: left; margin-right: 8px;" >|</li>
		<li style="float: left; margin-right: 8px;" >조회수 ${boardSearch.bfHit }</li>
		<li style="float: left; margin-right: 8px;" >|</li>
		<li style="float: left;">좋아요 ${boardSearch.bfThumbs }</li><br>
	</ul>
</c:forEach>

<div style="border-top: 3px solid #84C9E3;"></div>

</div>


<br><br><br>

	<div class="text-center" style="margin-top: 10px;">
		<ul class="pagination pagination-sm">
	
		<%-- 첫 페이지로 이동 (이동할게 없을때) --%>
		<c:if test="${pageMaker.curPage eq 1 }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${pageMaker.curPage ne 1 }">
			<li><a href="/board/bfBoard"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a></li>	
		</c:if>
		
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${pageMaker.curPage > 1 }">
			<li><a href="/board/bfBoard?curPage=${pageMaker.curPage - 1 }"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
		<%-- 이전 페이지로 가기 (이전으로 갈 페이지 없을때) --%>
		<c:if test="${pageMaker.curPage <= 1 }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_before</span></a></li>
		</c:if>
		
			
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="i">
		<c:if test="${pageMaker.curPage eq i }">
			<li class="active"><a href="/board/bfBoard?curPage=${i }">${i }</a></li>
		</c:if>
		
		<c:if test="${pageMaker.curPage ne i }">
			<li><a href="/board/bfBoard?curPage=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
	
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${pageMaker.curPage < pageMaker.totalPage }">
			<li><a href="/board/bfBoard?curPage=${pageMaker.curPage + 1 }"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
		<%-- 다음 페이지로 가기 (다음으로 갈 페이지 없을때) --%>
		<c:if test="${pageMaker.curPage >= pageMaker.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">navigate_next</span></a></li>
		</c:if>
		
	
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${pageMaker.curPage ne pageMaker.totalPage }">
			<li><a href="/board/bfBoard?curPage=${pageMaker.totalPage }" ><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		<%-- 끝 페이지로 이동 (끝으로갈게 없을때) --%>
		<c:if test="${pageMaker.curPage eq pageMaker.totalPage }">
			<li><a class="none"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a></li>	
		</c:if>
		
		</ul>
	</div>



<br><br><br>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center" style="text-align: center; float: right; margin-top: -105px;">
        	<button type="button" id="btnWrite" class="btn btn-warning btn-icon-text animatebutton"><i class="fa fa-check btn-icon-prepend" style="margin-right: 10px;"></i>글쓰기</button> 
        	
       </div>
    </div>
</div>

</div>

<%@include file="../layout/footer.jsp" %>


