<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	/* 목록 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();	
	});	
	
	/* 수정 페이지 이동 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="prodNo" value="${productInfo.prodNo}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/product/modify");
		$("#moveForm").submit();
	});	
	
	/* 삭제 버튼 */
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		let moveForm = $("#moveForm");
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="prodNo" value="${productInfo.prodNo}">');
		moveForm.attr("action", "/product/delete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});	
	
	/* 이미지호출 */
	let prodNo = '<c:out value="${productInfo.prodNo}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/product/getAttachList", {prodNo : prodNo}, function(arr) {
		
		/* 이미지 없을때 */
		if(arr.length === 0){
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/product/NoImage.png'>";
			str += "</div>";
			
			uploadResult.html(str);	
			
			return;
		}
		
		let str = "";
		let obj = arr[0];
		
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/product/display?fileName=" + fileCallPath +"'>";
		str += "</div>";		
		
		uploadResult.html(str);					
		
	})

})

</script>

<style type="text/css">
/* 관리자 컨텐츠 메인 영역 */
.form_section{
	width: 95%;
	margin-left: 2%;
    margin-top: 20px;
    border: 1px solid #dbdde2;
    background-color: #efefef;	
}

/* 버튼 영역 */
#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
}
</style>

<body>
 <div class="admin_content_wrap">
	<div class="admin_content_subject"><span>상품 상세</span></div>

	<div class="form_section">
		<label>카테고리</label>
		<input name="pCateName" value="<c:out value="${productInfo.pCateName }"/>" disabled>
	</div>	
	<div class="form_section">
			<label>상품아이디</label>
			<input name="prodNo" value="<c:out value="${productInfo.prodNo }"/>" disabled>
	</div>
	<div class="form_section">
			<label>상품명</label>
			<input name="pName" value="<c:out value="${productInfo.pName }"/>" disabled>
	</div>
	<div class="form_section">
			<label>등록일</label>
			<input name="pDate" value='<fmt:formatDate value="${productInfo.pDate }" pattern="yyyy.MM.dd HH:mm:ss"/>' disabled>
	</div>
	<div class="form_section">
			<label>가격</label>
			<input name="pPrice" value="<c:out value="${productInfo.pPrice }"/>" disabled>
	</div>
	<div class="form_section">
			<label>재고수량</label>
			<input name="pStock" value="<c:out value="${productInfo.pStock }"/>" disabled>
	</div>
	<div class="form_section">
			<label>상세정보</label>
			<input name="pDetail" value="<c:out value="${productInfo.pDetail }"/>" disabled>
	</div>
	<div class="form_section">
			<label>메인사진</label>
			<input name="pImage1" value="<c:out value="${productInfo.pImage1 }"/>" disabled>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>상품 이미지</label>
		</div>
		<div class="form_section_content">
			<div id="uploadResult"></div>
		</div>
	</div>

	<div class="btn_section">
		<button id="cancelBtn" class="btn">상품 목록</button>
		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	</div>  

	<form id="moveForm" action="/product/list" method="get" >
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<input type="hidden" name='prodNo' value="${productInfo.prodNo}">
	</form>
</div>
</body>
</html>