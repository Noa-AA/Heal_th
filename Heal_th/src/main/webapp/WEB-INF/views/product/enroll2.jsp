<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />

<script type="text/javascript">
$("#enrollbtn").click(function(){ //등록버튼
	
	/* 체크 변수 */
	let pNameCk = false;
	let pPriceCk = false;
	let pDetailCk = false;
	let pStockCk = false;
	/* 체크 대상 변수 */
	let pName = $('input[name=pName]').val();
	let pPrice = $('input[name=pPrice]').val();
	let pDetail = $('input[name=pDetail]').val();
	let pStock = $('input[name=pStock]').val();
	
	let wpName = $('#pName_warn');
	let wpPrice = $('#pPrice_warn');
	let wpDetail = $('#pDetail_warn');
	let wpStock = $('#pStock_warn');
	
	/* 공란체크 */
	if(pName ===''){
		wpName.css('display','block');
		pNameCk = false;
	} else {
		wpName.css('display','none');
		pNameCk = true;
	}	
	if(pPrice ===''){
		wpPrice.css('display','block');
		pPriceCk = false;
	} else {
		wpPrice.css('display','none');
		pPriceCk = true;
	}	
	if(pDetail ===''){
		wpDetail.css('display','block');
		pDetailCk = false;
	} else {
		wpDetail .css('display','none');
		pDetailCk = true;
	}	
	if(pStock ===''){
		wpStock.css('display','block');
		pStockCk = false;
	} else {
		wpStock.css('display','none');
		pStockCk = true;
	}	

	if(pNameCk && pPriceCk && pDetailCk && pStockCk){
		$(#"enrollForm").submit();	
	} else{
		return;
	}
	
});
</script>

<style type="text/css">
.formSectionContent span{    
    display: block;
    padding-top: 10px;
    text-align: center;
    color: #e05757;
    font-weight: 300;    
}
</style>

<body>

<div class="adminContentMain">
	<form action="/product/enroll2" method="post" id="enrollForm">
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품명</label>
			</div>
			<div class="formSectionContent">
				<input name="pName">
				<span id="pName_warn">상품명을 입력하세요.</span>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상품 가격</label>
			</div>
			<div class="formSectionContent">
				<input name="pPrice">
				<span id="pPrice_warn">상품가격을 입력하세요</span>
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>상세정보</label>
			</div>
			<div class="formSectionContent">
				<input name="pDetail">
				<span id="pDetail_warn">상품설명을 입력하세요.</span>
			</div>
		</div>
		<div class="formSection">
			<div class="formSectionTitle">
				<label>재고수량</label>
			</div>
			<div class="formSectionContent">
				<input name="pStock">
				<span id="pStock_warn">재고수량을 입력하세요.</span>
			</div>
		</div>
	<div class="btnSection">
		<button id="enrollbtn">등록</button>
		<button><a href="./list">취소</a></button>
	</div>
	</form><br>
</div>


</body>
</html>