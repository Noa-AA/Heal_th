<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".commentDelete").click(function() { //삭제하기
			console.log(".commentDelete click")
			console.log($(this).val())
			if (confirm("댓글을 삭제하시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "/comment/delete",
					data : {
						commentno : $(this).val()
					//댓글번호
					},
					dataType : "html",
					success : function(commentList) {
						console.log("댓글삭제AJAX 성공")

						commentListCall()
					},
					error : function() {
						console.log("댓글삭제AJAX 실패")
					}
				})

			} else {
				return false
			}
		})
	})
</script>

<table id="commentListTable">
	<c:forEach items="${commentList }" var="comment">
		<tbody class="commentOne">
			<tr>
				<%-- 		<td>댓글번호 : ${comment.commentNo } </td> --%>
				<td rowspan="2" style="width: 45px">
					<c:if test="${storedName == null }">
						<img src="/resources/img/mypage/userprofile.png" class="pIcon">
					</c:if>
					<c:if test="${storedName != null}">
						<img src="${pageContext.request.contextPath}/upload/${storedName.storedName}" class="pIcon">
					</c:if>
				</td>
				<td style="width: 300px">
					<span class="userNick">${comment.userNick } </span>
					(<fmt:formatDate value="${comment.commentDate }" pattern="yy-MM-dd  HH:mm:ss" />)
				</td>
				<td style="width: 15px"></td>
			</tr>
			<tr>
				<td class="commentContent">${comment.commentContent }
				</td>
				<%-- <c:set var="userNo" value='<%=session.getAttribute("userNo")%>'/> --%>
				<c:set var="userNo" value="${userNo }" />
				<c:choose>
					<c:when test="${comment.userNo eq userNo}">
						<td style="text-align: right"><img alt="" src="/resources/img/addOns/delete.png" class="commentDelete" value="${comment.commentNo}"></td>
						<%-- <button class="commentDelete" value="${comment.commentNo}">삭제</button> --%>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr id="commentSpace"></tr>
		</tbody>
	</c:forEach>
</table>