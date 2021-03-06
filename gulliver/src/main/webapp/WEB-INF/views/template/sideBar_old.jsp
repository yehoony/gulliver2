<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="spring.model.bookcate.BookcateDAO,java.util.List" %>

<html>
<head>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			$(this).next("ul").toggleClass("hide");
		});
	});
</script>
</head>
<div id="jb-container">
	<div id="jb-sidebar">
		<ul>
			<c:forEach var="dtoTop" items="${topCateList}" varStatus="status" >
				<li class="menu"><a>${dtoTop.BOOK_CATE_NAME}</a>
					<ul class="hide">
					
			   		   <c:set var="dtoMid" value="${midCateList[status.index]}"></c:set>
						<c:forEach var="dtoMid" items="${dtoMid}"  varStatus="status2">
							<li class="menu"><a>${dtoMid.BOOK_CATE_NAME}</a>
							<ul class="hide">
								<c:set var="dtoLow" value="${lowestCateList[status2.index]}" ></c:set>
								<c:forEach var="dtoLow" items="${dtoLow }">
								<li style="color: blue;">${dtoLow.BOOK_CATE_NAME }</li>
								</c:forEach>
							</ul>
						</c:forEach>
						
					</ul>
				</li>
			</c:forEach> 
		</ul>
	</div>
</div> 
<!-- 상단 메뉴 끝 -->

