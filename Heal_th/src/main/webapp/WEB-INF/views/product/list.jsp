<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/adminheader.jsp" />
<body>

<h2>상품 상세정보</h2>

<table>
<tr>
	<td>상품사진</td>
	<td>
		<table>
<c:forEach items="${list }" var="product">
			<tr>
				<td>상품번호</td>
				<td>${list.prodNo }</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>${list.pName }</td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td>${list.pPrice }</td>
			</tr>
</c:forEach>
		</table>
	</td>
	<td></td>
	<td></td>
</tr>
</table>

</tbody>
</body>
</html>
