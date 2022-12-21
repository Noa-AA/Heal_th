<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#twoDepth-list a:nth-child(3) {
	color: #b571e9;
	border-bottom: 2px solid #b571e9;
	margin-top: 1px;
	font-weight: 700;
}

#twoDepth-list a {
	width: 33.3%;
}

.container {
	margin-top: 40px;
}

.area {
	margin: 10px 5px;
	padding: 10px;
}

.area-title {
	width: 100%;
	padding: 5px;
	border-bottom: 1px solid gray;
}

.area-title * {
	width: auto;
	padding: 3px;
	font-size: 20px;
	font-weight: bold;
	color: #fff;
	background: #c583d6;
	font-weight: bold;
	border-radius: 5px;
}

.area-body {
	padding: 5px;
	border-bottom: 1px solid gray;
}

.input-group {
	padding: 2px;
}

.input-group label {
	margin-right: 2px;
}

input:disabled, input {
	background: none;
	border: none;
}

#photo_area img {
	height: 200px;
	width: 300px;
}

#newphoto_area img {
	height: 200px;
	width: 300px;
}

#btn_area {
	text-align: center;
}
</style>
</head>

<body>
	<div id="subvisual">
		<div id="subvisual-A">
			<p id="subv-title">챌린지 사진 인증</p>
		</div>
	</div>
	<div id="twoDepth">
		<div id="twoDepth-list">
			<a href="/challenge/list">챌린지 리스트</a>
			<a href="/challenge/create">챌린지 만들기</a>
			<a href="/challenge/mypage">챌린지 마이페이지/인증</a>
		</div>
	</div>

	<div class="container">
		<div id="chlInfo_area" class="area">
			<div class="area-title">
				<span>챌린지 정보</span>
			</div>
			<div class="area-body">
				<div class="input-group">
					<label>번호 : </label>
					<input type="text" name="challengeNo" id="challengeNo" value="${pageInfo.challengeNo}" disabled="disabled" />
				</div>
				<div class="input-group">
					<label>제목 : </label>
					<input type="text" name="challengeName" id="challengeName" value="${pageInfo.challengeName}" disabled="disabled" />
				</div>
				<div class="input-group">
					<label>생성일 : </label>
					<input type="text" name="challengeCredate" id="challengeCredate" value="<fmt:formatDate value="${pageInfo.challengeCredate}" pattern="yyyy년 MM월 dd일"/>">
				</div>
				<div class="input-group">
					<label>종료일 : </label>
					<input type="text" name="challengeEnddate" id="challengeEnddate" value="<fmt:formatDate value="${pageInfo.challengeEnddate}" pattern="yyyy년 MM월 dd일"/>">
				</div>
			</div>
		</div>

		<div id="photo_area" class="area">
			<div class="area-title">
				<span>나의 인증사진들</span>
			</div>
			<div class="area-body">
				<div class="input-group">
					<c:forEach items="${list }" var="photo">
						<%-- 						<img src="/resources/img/chl_confirm/chl_con${pageInfo.challengeNo}.jpg" onerror="this.src='https://shared-comic.pstatic.net/thumb/webtoon/796152/thumbnail/thumbnail_IMAG10_a500c803-99ec-4bf8-92d1-b2a5c60c9789.jpg'"> --%>
						<fmt:formatDate value="${photo.regiDate }" pattern="yyyy년 MM월 dd일" />
						<%-- 						<img src="/resources/img/chl_confirm/chl_con${pageInfo.challengeNo}_${pageInfo.challengeNo}.jpg" onerror="this.src='https://shared-comic.pstatic.net/thumb/webtoon/796152/thumbnail/thumbnail_IMAG10_a500c803-99ec-4bf8-92d1-b2a5c60c9789.jpg'"> --%>
					</c:forEach>
				</div>
			</div>
		</div>

		<form action="./photopage" method="post" enctype="multipart/form-data">
			<div id="newphoto_area" class="area">
				<div class="area-title">
					<span>새로 인증할 사진</span>
				</div>
				<div class="area-body">
					<div class="input-group">
						<label for="file">첨부파일</label>
						<input type="file" name="file" id="file">
						이미지 유효성 검사
					</div>
				</div>
			</div>

			<div id="btn_area" class="area">
				<button>확인</button>
			</div>
		</form>
	</div>
</body>
<%@include file="../layout/footer.jsp"%>
</html>