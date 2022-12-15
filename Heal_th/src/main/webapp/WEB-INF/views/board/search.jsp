<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		type: 'GET',
		url : "/board/search",
		data : $("form[name=searchForm]").serialize(),
		success : function(result){
			//테이블 초기화
			$('#boardtable > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.idx+"</td>";
					str+="<td>"+item.writer+"</td>";
					str+="<td><a href = '/board/detail?idx=" + item.idx + "'>" + item.title + "</a></td>";
					str+="<td>"+item.date+"</td>";
					str+="<td>"+item.hit+"</td>";
					str+="</tr>"
					$('#boardtable').append(str);
        		})				 
			}
		}
	})
})

</script>


</head>
<body>

<div>

<form action="/board/search" method="post"  name="searchForm">
	<select name="search_option">
        <option value="user_id"
			<c:if test="${map.search_option == 'user_no'}">selected</c:if>
		>작성자</option>
 
        <option value="title" 
			<c:if test="${map.search_option == 'bfTitle'}">selected</c:if>
        >제목</option>
 
        <option value="content" 
			<c:if test="${map.search_option == 'befoer_con'}">selected</c:if>
			<c:if test="${map.search_option == 'after_con'}">selected</c:if>
        >내용</option>
 
<!--         <option value="all"  -->
<%-- 			<c:if test="${map.search_option == 'all'}">selected</c:if> --%>
<!--         >작성자+내용+제목</option> -->
 
    </select>


	<div class="search">
		<input name="keyword" type="text" placeholder="검색어를 입력해주세요">
	</div>

	<button>검색하기</button>

</form>

</div>

</body>
</html>