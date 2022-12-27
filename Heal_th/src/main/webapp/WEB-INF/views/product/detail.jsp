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
		let addInput = '<input type="hidden" name="prodNo" value="${goodsInfo.prodNo}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/product/modify");
		$("#moveForm").submit();
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
.admin_content_wrap{
overflow: scroll
}

/* 버튼 영역 */
#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
</style>
<body>
 <div class="admin_content_wrap">
	<div class="admin_content_subject"><span>상품 상세</span></div>

	<div class="form_section">
		<div class="form_section_title">
			<label>카테고리</label>
		</div>
		<div class="form_section_content">
			<input name="pCateName" value="<c:out value="${productInfo.pCateName }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>상품명</label>
		</div>
		<div class="form_section_content">
			<input name="pName" value="<c:out value="${productInfo.pName }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>상품아이디</label>
		</div>
		<div class="form_section_content">
			<input name="prodNo" value="<c:out value="${productInfo.prodNo }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>가격</label>
		</div>
		<div class="form_section_content">
			<input name="pPrice" value="<c:out value="${productInfo.pPrice }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>메인사진</label>
		</div>
		<div class="form_section_content">
			<input name="pImage1" value="<c:out value="${productInfo.pImage1 }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>추가사진</label>
		</div>
		<div class="form_section_content">
			<input name="pImage2" value="<c:out value="${productInfo.pImage2 }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>상세정보</label>
		</div>
		<div class="form_section_content">
			<input name="pDetail" value="<c:out value="${productInfo.pDetail }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>등록일</label>
		</div>
		<div class="form_section_content">
			<input name="pDate" value='<fmt:formatDate value="${productInfo.pDate }" pattern="yyyy.MM.dd HH:mm:ss"/>' disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>재고수량</label>
		</div>
		<div class="form_section_content">
			<input name="pStock" value="<c:out value="${productInfo.pStock }"/>" disabled>
		</div>
	</div>
	<div class="form_section">
		<div class="form_section_title">
			<label>판매수량</label>
		</div>
		<div class="form_section_content">
			<input name="pSell" value="<c:out value="${productInfo.pSell }"/>" disabled>
		</div>
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
	</div>  

	<form id="moveForm" action="/product/list" method="get" >
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>
</div>
</body>
</html>