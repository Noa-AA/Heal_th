<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="../layout/adminheader.jsp" />
<script type="text/javascript">
$(document).ready(function() { //공지사항으로 이동
	
	$("#btnNotice").click(function() {
		$(location).attr("href", "./list")
	})
	$("#btnList").click(function() {
		$(location).attr("href", "./list")
	})
	$("#btnReport").click(function() {
		$(location).attr("href", "/report/report")
	})
	
	$("#btnWrite").click(function() {
		$(location).attr("href", "./write")
	})
	
	let moveForm = $("#moveForm");

	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='noticeNo' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "/notice/view");
		moveForm.submit();
	});

	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/notice/list");
		moveForm.submit();
		
	});	
	
	
	$(".search_area button").on("click", function(e){
		e.preventDefault();
		
		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();
		
		if(!type){
			alert("검색 종류를 선택하세요.");
			return false;
		}
		
		if(!keyword){
			alert("키워드를 입력하세요.");
			return false;
		}		
		
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});

})
$(document).ready(function(){ //등록 알림창
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "write success"){
            alert("공지사항 등록이 완료되었습니다.");
        }
        if(result === "delete success"){
            alert("게시글이 삭제되었습니다.");
        }
        
    }    
    
});
</script>
<style type="text/css">
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background: linear-gradient(to right, #3f94d6 0 , #1869a7);
    height: 65px;
    line-height: 67px;
    color: white;	
}
table{font-size:  17px;}

.btnWrap{
	margin: 15px 2px;
}
.menuBtn{
	width: 150px; 
	height: 40px;
	background-color: white;
	border: 1px solid #3f94d6;
	color: #1869a7;
	padding: 5px;
}
.menuBtn:hover{
color: white; 
background: linear-gradient(to right, #3f94d6 0 , #1869a7);
}
.menuBtnSel{
   width: 150px; 
   height: 40px;
   border: 1px solid #3f94d6;
   padding: 5px;
   background: linear-gradient(to right, #3f94d6 0 , #1869a7);
   color: white; 
}

#btnNotice{
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
}
#btnReport{
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
}
.search_area{
	padding-top: 30px;
  }
.search_area input{
    height: 30px;
  width: 250px;
}

	/* 검색 영역 */
.search_wrap{
	margin-top:15px;
	text-align: center;
}
.search_input{
    position: relative;
    text-align:center;	
}
.search_input input[name='keyword']{
	padding: 4px 10px;
    font-size: 15px;
    height: 25px;
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
	text-align: center;
    margin-top: 30px;
    margin-bottom: 40px;
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
.pageInfo_btn a:link {color: black;}
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
    background-color: #c3daf7;
}

</style>
<div class="admin_content_subject"><span>게시글 관리</span></div>
<div class="btnWrap">
<h3><button type="button" id="btnNotice" class="menuBtn menuBtnSel">공지사항</button><button type="button" id="btnReport" class="menuBtn">신고글 관리</button></h3>
</div>
<table class="table table-hover">
<thead>
	<tr style="font-size:  19px"">
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 10%;">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.noticeNo }</td>
		<td><a href="/notice/view?noticeNo=${notice.noticeNo }">${notice.noticeTtl }</a></td>
		<td>${notice.adminName }</td>
		<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd" /></td>
		<td>${notice.noticeHit }</td>
	</tr>
</c:forEach>


</tbody>

</table>

<div class="search_wrap">
	<div class="search_area">
		<div class="search_input">
			<select name="type">
				<option value="T" <c:out value="${page.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${page.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="TC" <c:out value="${page.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>	
			</select>
			<input type="text" name="keyword" value="${page.cri.keyword }">
			<button class='search_btn'>검색</button>
		</div>
	</div>
</div>

<button id="btnWrite" class="bottomBtn">글쓰기</button>
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

	<form id="moveForm" method="get">	
		<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
		<input type="hidden" name="amount" value="${page.cri.amount }">
		<input type="hidden" name="keyword" value="${page.cri.keyword }">	
		<input type="hidden" name="type" value="${page.cri.type }">	
	</form>

</body>
</html>
