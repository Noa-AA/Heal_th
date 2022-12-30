<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
.challenge-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: auto;
	gap: 50px 50px;
	width: 1200px;
	margin-top: -16px;
}

.challenge {
	position: relative;
	flex: 1 1 30%;
	border: 1px solid #cfcfcf;
	box-shadow: 1px 1px 8px 0px rgb(0 0 0/ 10%);
	border-radius: 10px;
	text-align: center;
	width: 400px;
	height: 300px;
}

.challenge-content {
	margin-top: 30px;
}

.challenge img {
	border: 0;
	margin-top: 20px;
	height: 100px;
	width: 200px;
}

.search_area {
	display: inline-block;
	text-align: center;
	margin-top: 0px;
}

.search_area input {
	height: 36px;
	width: 250px;
}

.search_area button {
	width: 100px;
	height: 36px;
}

.search_area select {
	height: 35px;
}

.pageInfo_wrap {
	text-align: center;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}
</style>


</head>
<body>

	<!-- 관리자 로그인 상태일때 -->
	<c:if test="${!empty adminNo && empty userId}">
		<jsp:include page="../layout/adminheader.jsp" />
	</c:if>

	<!-- 회원 로그인 상태일때 -->
	<c:if test="${empty adminNo}">
		<%@include file="../layout/header.jsp"%>
		<jsp:include page="./layout/chlSubvisual.jsp" />
	</c:if>


	<div class="total-list">
		<div class="challenge-list">
			<c:forEach items="${list }" var="challenge">

				<div class="challenge">
					<div class="challenge-thumbnail">
						<img src="/resources/img/chl_thumbnail/chl_thumb${challenge.challengeNo }.jpg" onerror="this.src='https://shared-comic.pstatic.net/thumb/webtoon/796152/thumbnail/thumbnail_IMAG10_a500c803-99ec-4bf8-92d1-b2a5c60c9789.jpg'">
					</div>
					<div class="challenge-content">
						<ul>
							<li>
								챌린지 번호 :
								<c:out value="${challenge.challengeNo}" />
							</li>
							<li>
								제목 :
								<a class="move" href='<c:out value="${challenge.challengeNo}"/>'>
									<c:out value="${challenge.challengeName}" />
								</a>
							</li>
							<li>종류 : ${challenge.challengeKind }</li>
							<li>
								생성일 :
								<fmt:formatDate value="${challenge.challengeCredate }" pattern="yyyy년 MM월 dd일" />
							</li>
							<li>
								종료일 :
								<fmt:formatDate value="${challenge.challengeEnddate }" pattern="yyyy년 MM월 dd일" />
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>




			<div class="search_wrap">
				<div class="search_area">
					<select name="type">
						<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
						<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>종류</option>
						<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 종류</option>
					</select>
					<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
					<button>검색</button>
				</div>
			</div>
		</div>


		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">

					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous">
							<a href="${pageMaker.startPage-1}">Previous</a>
						</li>
					</c:if>

					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next">
							<a href="${pageMaker.endPage + 1 }">Next</a>
						</li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" id="challengeNo" name="challengeNo" value='<c:out value="${pageInfo.challengeNo}"/>'>
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>




	<script>
		//챌린지 상세보기
		let moveForm = $("#moveForm");
		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm.empty();
							moveForm
									.append("<input type='hidden' name='challengeNo' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/challenge/view");
							moveForm.submit();
						});

		//페이지 이동 번호 동작
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/challenge/list");
			moveForm.submit();

		});

		//검색 버튼
		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
<%@include file="../layout/footer.jsp"%>
</html>