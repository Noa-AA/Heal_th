<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${scrapList }" var="scrap">
	<div id="scrapOne">
		<button class="scrapDelete" value="${scrap.scrapNo}"><img alt="" src="/resources/img/addOns/delete.png" class="scrapDeleteBtn"></button>
		<p>${scrap.categoryName } 게시판</p>
			<c:choose>
				<c:when test="${scrap.categoryNo eq 1}"> <!-- bf 게시판 -->
					<a href="/board/bfView?bfNo=${scrap.boardNo}">${scrap.title }</a>
					<span class="boardContent">사랑의 그들은 그들의 청춘의 피가 반짝이는 그러므로 있다. 있을 풀밭에 뜨고, 있는가? 거친 방지하는 품으며, 그와 뿐이다. 가지에 오아이스도 있음으로써 끓는다. 예수는 청춘에서만 같이, 가는 소담스러운 있다. 웅대한 구하기 사람은 운다.</span>
				</c:when>
				<c:when test="${scrap.categoryNo eq 2}"> <!-- 운동인증 게시판 -->
					<a href="/board/verifyView?verifyNo=${scrap.boardNo}">${scrap.title }</a>
					<span class="boardContent">천하를 오아이스도 그들의 위하여 피가 곳이 아름답고 뿐이다. 생생하며, 이상, 방황하였으며, 앞이 뜨고, 투명하되 청춘 말이다. 열락의 인간이 설산에서 보내는 그들은 밥을 부패뿐이다. 풍부하게 귀는 보내는 청춘의 청춘 무엇이 무한한 품에 있는가? 보이는 그러므로 있음으로써 이성은 지혜는 뼈 우리의 이상 피다. 공자는 청춘의 얼음에 보는 인간의 낙원을 타오르고 인생을 무한한 철환하였는가? 인생에 설레는 인간의 굳세게 너의 우리 뿐이다.</span>
				</c:when>
				<c:when test="${scrap.categoryNo eq 3}"> <!-- 식단공유 게시판 -->
					<a href="/board/dView?dietNo=${scrap.boardNo}">${scrap.title }</a>
					<span class="boardContent">인생에 피고 위하여 현저하게 끓는 인간의 황금시대를 기쁘며, 용기가 있다. 기쁘며, 구하지 싸인 봄바람이다. 어디 물방아 피어나기 바이며, 있는가? 무엇을 열매를 넣는 튼튼하며, 과실이 그들은 무엇을 풍부하게 청춘의 아니다. 평화스러운 용기가 끓는 황금시대다. 꽃이 황금시대의 할지라도 이상이 안고, 무엇을 이상의 구할 보는 그리하였는가? 얼마나 품으며, 방지하는 그들은 끝에 봄바람이다.</span>
				</c:when>
				<c:otherwise>	<!-- 후기, 시설리뷰 게시판 -->
					<a href="/board/rView?reviewNo=${scrap.boardNo}">${scrap.title }</a>
					<span class="boardContent">가슴이 웅대한 속에서 것이다. 거선의 보이는 인간의 이 끓는 무엇을 피부가 피가 되는 피다. 꽃이 같은 인간에 미묘한 우리 놀이 눈이 보내는 무엇이 것이다. 인생에 남는 이상은 품에 밝은 이는 칼이다. 영원히 부패를 같이, 운다. 곳으로 거친 모래뿐일 아니더면, 우리 뼈 이것이다. 가치를 구할 전인 산야에 밝은 있는가?</span>
				</c:otherwise>
			</c:choose>
	</div>
</c:forEach>
<c:choose>
	<c:when test="${scrapEmpty eq false }">
		<div id="scrapEmpty">
			<p id="scrapEnd">스크랩 목록이 존재하지 않습니다</p>
		</div>
	</c:when>
</c:choose>
    