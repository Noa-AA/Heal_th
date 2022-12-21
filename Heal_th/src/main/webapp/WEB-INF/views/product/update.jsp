<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnUpdate").click(function(){ //등록 버튼
		$("div").submit();
	});
})	
</script>
<style type="text/css">

</style>

<body>

<div class="adminContentMain">
	<form action="/product/update" method="post" id="updateForm">
		<div class="formSection">
		<div class="formSectionTitle">
			<label>카테고리</label>
		</div>
		<div class="formSectionContent">
			<div class="cate_wrap">
				<select name="pCateNo" value="${updateProduct.pCateNo }">
					<option value="none" selected>=== 상품분류 ===</option>
					<option value="10">운동용품</option>
					<option value="20">보조제</option>
					<option value="30">다이어트식품</option>
				</select>
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품명</label>
			</div>
			<div class="formSectionContent">
				<input name="pName" value="${updateProduct.pName }">
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품 가격</label>
			</div>
			<div class="formSectionContent">
				<input name="pPrice" value="${updateProduct.pPrice }">
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상세정보</label>
			</div>
			<div class="formSectionContent">
				<input name="pDetail" value="${updateProduct.pDetail }">
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>재고수량</label>
			</div>
			<div class="formSectionContent">
				<input name="pStock" value="${updateProduct.pStock }">
			</div>
		</div>
	<div class="btnSection">
		<button type="submit" id="btnUpdate">등록</button>
		<button id="btnCancel"><a href="/product/list">취소</a></button>
	</div>
	</form><br>
</div>

</body>
</html>