<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${fileList }" var="files">
	<div>
		<img src="${pageContext.request.contextPath}/upload/${files.fileSto }" width="100px" height="100px"/><br>
		<button type="button" class="deleteBtn"><img alt="" src="/resources/img/addOns/delete.png" class="deleteBtnImg"></button>
	</div>
</c:forEach>