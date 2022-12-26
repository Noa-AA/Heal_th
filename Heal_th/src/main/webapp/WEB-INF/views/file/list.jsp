<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- slick 이용 이미지 불러오기 -->

<!-- <div class="slider-for"> -->
<%-- 	<c:forEach items="${fileList }" var="files"> --%>
<!-- 		<div> -->
<%-- 				<img src="${pageContext.request.contextPath}/upload/${files.fileSto }" width="100px" height="100px"/> --%>
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
<!-- </div> -->
<!-- <div class="slider-nav"> -->
<%-- 	<c:forEach items="${fileList }" var="files"> --%>
<!-- 		<div> -->
<%-- 				<img src="${pageContext.request.contextPath}/upload/${files.fileSto }" width="100px" height="100px"/> --%>
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
<!-- </div> -->

<!-- swipe로 이미지 불러오기 -->
	<div id="photoList">
		<div
			style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
			class="swiper mySwiper2">
			<div class="swiper-wrapper">
				<c:forEach items="${fileList }" var="files">
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/upload/${files.fileSto }" width="100px" height="100px"/>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-button-next" sytle="background-color:gray"></div>
			<div class="swiper-button-prev"></div>
		</div>

		<div thumbsSlider="" class="swiper mySwiper">
			<div class="swiper-wrapper">
				<c:forEach items="${fileList }" var="files">
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/upload/${files.fileSto }" width="100px" height="100px"/>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- end photoList


<!-- 사진 불러오기 -->
<%-- <c:forEach items="${fileList }" var="files"> --%>
<%-- 		<img src="${pageContext.request.contextPath}/upload/${files.fileSto }" width="100px" height="100px"/> --%>
<%-- </c:forEach> --%>