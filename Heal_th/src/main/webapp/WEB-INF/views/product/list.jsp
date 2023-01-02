<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function () {
	
	let eResult = '<c:out value="${enroll_result}"/>';
	
	checkResult(eResult);
	
	function checkResult(result) {
		if(result ==''){
			return;
		}
		alert("상품 ' "+eResult+" '을 등록하였습니다.");
	}
	
	let modify_result = '${modify_result}';
	
	if(modify_result == 1){
		alert("수정 완료");
	}	
	
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	}	

	let moveForm = $("#moveForm");
	
	//썸네일 이미지
	$(".image_wrap").each(function(i, obj){
		
		const pobj = $(obj);
		
		if(pobj.data("prodno")) {
			
		const uploadPath = pobj.data("path");
		const uuid = pobj.data("uuid");
		const fileName = pobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		$(this).find("img").attr('src', '/product/display?fileName=' + fileCallPath);
		
		} else {
			$(this).find("img").attr('src', '/resources/img/product/NoImage.png');
		}
		
	});

	/* 페이지 이동 버튼 */
	$(".pageInfo_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
// 	moveForm.attr("action", "/product/list");
	moveForm.submit();
	
	});
	
	/* 상품 조회 페이지 */
	$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='prodNo' value='"+$(this).attr("href") + "'>");
	moveForm.attr("action", "/product/detail");
	moveForm.submit();
	
	
	});
	
	
	
});

$(document).ready(function() { 
	
	$("#btnEnroll").click(function() {
		$(location).attr("href", "./enroll")
	})
	$("#btnList").click(function() {
		$(location).attr("href", "./list")
	})
})
</script>
<style type="text/css">
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background: linear-gradient(to right, #3f94d6 0 , #1869a7);
    height: 72px;
    line-height: 75px;
    color: white;	
}
/* 상품 목록 영역 */
.goods_table_wrap{
	padding: 20px 35px
}
.goods_table{
	width: 100%;
    border: 1px solid #d3d8e1;
    text-align: center;
    border-collapse: collapse;
}
.goods_table td{
	padding: 10px 5px;
	border : 1px solid #e9ebf0;
	font-size: 16px;
}
.goods_table thead{
	background-color: #f8f9fd;	
	font-weight: 600;
}
.goods_table a{
	color:#1088ed;
	font-weight: 500;
}
.th_column_1{
	width:120px;
}
.th_column_3{
	width:110px;
}
.th_column_4{
	width:140px;
}
.th_column_5{
	width:140px;
}
.th_column_6{
	
}
	
.table_empty{
	height: 50px;
    text-align: center;
    margin: 200px 0 215px 0px;
    font-size: 25px;
}

.image_wrap {
    width: 100%;
    height: 100%;
		}	
.image_wrap img {
    max-width: 50%;
    height: auto;
}

	/* 검색 영역 */
.search_wrap{
	margin-top:15px;
}
.search_input{
    position: relative;
    text-align:center;	
}
.search_input input[name='keyword']{
	padding: 4px 10px;
    font-size: 25px;
    height: 32px;
    line-height: 20px;
}
.search_btn{
	height: 32px;
    width: 80px;
    font-weight: 600;
    font-size: 18px;
    line-height: 20px;
    position: absolute;
    margin-left: 15px;
    background-color: #c3daf7;
}


	/* 페이지 버튼 인터페이스 */
.pageInfo_wrap{
    margin-top: 21px;
    margin-bottom: 40px;
    margin-left: 567px;
}
.pageInfo{
    list-style: none;
    display: inline-block;
}	
.pageInfo_btn {
    float: left;
    width: 40px;
    height: 40px;
    line-height: 40px;
    margin-left: 20px;
}
.active{
	border : 2px solid black;
	font-weight:400;
}
.next, .prev {
    border: 1px solid #ccc;
    padding: 0 10px;
}
.pageInfo_btn a:link {color: black; padding: 15px;}
.pageInfo_btn a:visited {color: black;}
.pageInfo_btn a:active {color: black;}
.pageInfo_btn a:hover {color: black;}
.next a, .prev a {
    color: #ccc;
}
.bottomBtn{
	float: right;  
	height: 32px;
    width: 80px;
    font-weight: 600;
    font-size: 18px;
    line-height: 20px;
    margin-left: 15px;
}
</style>

<body>

<div class="admin_content_wrap">
	<div class="admin_content_subject"><span>상품 관리</span></div>
	<div class="goods_table_wrap">
      <table class="goods_table">       
		<thead>
		<tr>
			<td class="th_column_1" style="width: 10%;">카테고리</td>
			<td class="th_column_2" style="width: 10%;">상품번호</td>
			<td class="th_column_3" style="width: 15%;">이미지</td>
			<td class="th_column_4" style="width: 30%;">상품명</td>
			<td class="th_column_5" style="width: 10%;">상품가격</td>
			<td class="th_column_6" style="width: 15%;">등록일</td>
			<td class="th_column_7" style="width: 10%;">재고수량</td>
		</tr>
		</thead>
		<c:forEach items="${list }" var="list">
		<tr>
			<td><c:out value="${list.pCateName }"></c:out></td>	
			<td><c:out value="${list.prodNo }"></c:out></td>	
			<td class="image">
				<div class="image_wrap" data-prodNo="${list.imageList[0].prodNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
					<img>
				</div>
			</td>	
<%-- 			<td><c:out value="${list.pImage1 }"></c:out></td>	 --%>
			<td>
				<a class="move" href= '<c:out value="${list.prodNo }"/>' >
					<c:out value="${list.pName }"></c:out>
				</a>
			</td>
			<td><c:out value="${list.pPrice }"></c:out></td>
			<td><fmt:formatDate value="${list.pDate }" pattern="yyyy-MM-dd" /></td>
			<td><c:out value="${list.pStock }"></c:out></td>	
		</tr>
		</c:forEach>
	</table>
<!-- 검색 영역 -->
<div class="search_wrap">
	<form id="searchForm" action="/product/list" method="get">
		<div class="search_input">
   			<input type="text" name="keyword" value='<c:out value="${page.cri.keyword}"></c:out>'>
   			<input type="hidden" name="pageNum" value='<c:out value="${page.cri.pageNum }"></c:out>'>
   			<input type="hidden" name="amount" value='${page.cri.amount}'>
   			<input type="hidden" name="type" value="G">
   			<button class='btn search_btn'>검 색</button>                				
		</div>
	</form>
</div>

<button id="btnEnroll" class="bottomBtn">상품등록</button>
<button id="btnList" class="bottomBtn">목 록</button>

<!-- 페이지 이동 인터페이스 영역 -->
<div class="pageInfo_wrap" >
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
		 
				<!-- 이전페이지 버튼 -->
				<c:if test="${page.prev}">
					<li class="pageInfo_btn previous"><a href="${page.pageStart - 1}">Previous</a></li>
				</c:if>
				
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${page.pageStart}" end="${page.pageEnd}">
					<li class="pageInfo_btn ${page.cri.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a></li>
				</c:forEach>
				
				<!-- 다음페이지 버튼 -->
				<c:if test="${page.next}">
					<li class="pageInfo_btn next"><a href="${page.pageEnd + 1 }">Next</a></li>
				</c:if>	
		 	
		 </ul>
 	</div>
</div>

	<form id="moveForm" action="/product/list" method="get">	
		<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
		<input type="hidden" name="amount" value="${page.cri.amount }">
		<input type="hidden" name="keyword" value="${page.cri.keyword }">	
	</form>
	
</div>                   
</div>

</body>
</html>




