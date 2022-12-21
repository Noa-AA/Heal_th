<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	$("#btnList").click(function() {
		$(location).attr("href", "./list")
	})
	
	$("#btnEnroll").click(function() {
		$(location).attr("href", "./enroll")
	})

	$("#btnUpdate").click(function() {
		$(location).attr("href", "/product/update?prodNo=${viewProduct.prodNo}")
	})

	$("#btnDelete").click(function() {
		$(location).attr("href", "/product/delete?prodNo=${viewProduct.prodNo}")
	})
	
	/* 이미지호출 */
	let prodNo = '<c:out value="${viewProduct.prodNo}"/>';
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
<body>

<h2>제품 상세보기</h2>


	<div>카테고리</div>
	<div>${viewProduct.pCateNo }</div>
	
	<div>상품명</div>
	<div>${viewProduct.pName }</div>

	<div>상품아이디</div>
	<div>${viewProduct.prodNo }</div>
	
	<div>가격</div>
	<div>${viewProduct.pPrice }</div>
	
	<div>메인사진</div>
	<div>${viewProduct.pImage1 }</div>
	
	<div>추가사진</div>
	<div>${viewProduct.pImage2 }</div>
	
	<div>상세정보</div>
	<div>${viewProduct.pDetail }</div>
	
	<div>등록일</div>
	<div><fmt:formatDate value="${viewProduct.pDate }" pattern="yyyy.MM.dd HH:mm:ss" /></div>
	
	<div>재고수량</div>
	<div>${viewProduct.pStock }</div>
	
	<div>판매수량</div>
	<div>${viewProduct.pSell }</div>
	
	<div>
		<label>상품 이미지</label>
	</div>
	<div>
		<div id="uploadResult">
		</div>
	</div>

<button id="btnUpdate">상품수정</button><button id="btnDelete">삭제</button> <button id="btnEnroll">상품등록</button> <button id="btnList">목록</button>

</body>
</html>