<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String root = request.getContextPath();
	String userid = (String)session.getAttribute("userid");
	String grade = (String)session.getAttribute("grade") ; 
%>

<html>
<head>
<style>
#jb-container {
	width: 1200px; margin : 0px auto;
	padding: 2px;
	border: 1px solid #ffffff;
	margin: 0px auto;
}

#jb-header {
	padding: 20px;
	margin-bottom: 10px;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
	width: 235px;
	padding: 0px;
	margin-bottom: 10px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-content {
	width: 950px;
	padding: 0px;
	margin-bottom: 10px;
	float: right;
	border: 1px solid #bcbcbc;
}

#jb-footer {
	clear: both;
	padding: 2px;
	border: 1px solid #bcbcbc;
	background-color: #009AFF
}
</style>

<style>
.menu a {
	cursor: pointer;
	font-weight: bold;
}
.menu .hide li{
	display: none;
}
ul{
list-style-type: none;
padding-left: 0;

}
li{

padding-left: 20px }
</style>
<style>
#topMenu {
	height: 30px; /* 메인 메뉴의 높이 */
	width: 100%; /* 메인 메뉴의 넓이 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	background: #00A5FF;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
	text-align: center;
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white; /* 글씨 색을 흰색으로 설정 */
	background-color: #00A5FF; /* 배경 색을 RGB(2D2D2D)로 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
	display: inline-block;
}


.menuLink, .submenuLink, .adminMenuLink{ /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 100px; /* 기본 넓이를 설정 */
	font-size: 12px; /* 폰트 사이즈를 12px로 설정 */
	font-weight: bold; /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}
.adminMenuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: yellow;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: black; /* 글씨 색  */
	/*  background-color: #000000;  /* 배경색을 밝은 회색으로 설정 */
	*/
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #000000; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: #FFDC3C; /* 배경색을 흰색으로 설정 */
	border: solid 0px black; /* 테두리를 설정 */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px; /* 넓이는 190px로 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 200px; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red; /* 글씨색을 빨간색으로 설정 */
	/*     background-color: #dddddd;  /* 배경을 RGB(DDDDDD)로 설정 */
	
}
</style>
</head>
<body>
	<!-- 상단 메뉴 -->
<div id="jb-container">
<div id="jb-sidebar">
			
			<% if(userid!=null && grade.equals("M")){%>
				<ul ><a  href="<%=root %>/user/MyPage"><strong>&nbsp;마이페이지</a><br></strong>
					<li><a  href="<%=root %>/user/read">나의정보</a></li>
					<li><a  href="<%=root %>/cart/list">장바구니보기</a></li>
					<li><a  href="<%=root%>/order/list">주문이력</a></li>
				</ul>
			</ul>
			<%} %>
			<%if(userid!=null && grade.equals("A")){ %>
				<ul><a  href="<%=root %>/adm/adminPage"><strong>&nbsp;관리자 메뉴<br></strong>
					<li><a href="<%=root%>/adm/faq/list">FAQ관리</a></li>
					<li><a href="<%=root%>/adm/user/list">회원관리</a></li>
					<li><a href="<%=root%>/adm/cart/list">장바구니관리</a></li>
					<li><a href="<%=root%>/order/list">전체주문조회</a></li>
					<li><a href="<%=root%>/adm/bookinfo/create">서적등록</a></li>
					<li><a href="<%=root%>/adm/bookinfo/admin_bookinfoList">서적관리</a></li>
				</ul>
				</li>
			<%} %>
</div>
</div>
<!-- 사이드바 메뉴끝 -->