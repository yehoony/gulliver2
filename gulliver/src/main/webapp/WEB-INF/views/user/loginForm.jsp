<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 	request.setCharacterEncoding("utf-8"); 
/* 	String root=request.getContextPath();
	String c_id=(String)request.getAttribute("c_id");
	String c_id_val=(String)request.getAttribute("c_id_val"); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 14px;
}
</style>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css"> 
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">로그인</DIV>

	<FORM name='frm' method='POST' action='${pageContext.request.contextPath }/user/login'>
		<TABLE class='table'>
			<TR>
				<TH>아이디</TH>
				<TD><input type="text" name="userid" size="20" value="${c_id_val}"> 
					<c:choose>
						<c:when test="${c_id eq 'Y'}">
							<input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장
						</c:when>
						<c:otherwise>
							<input type='checkbox' name='c_id' value='Y'>ID 저장
						</c:otherwise>
					</c:choose>
		
			<%-- <% 
	       if (c_id.equals("Y")){  // id 저장 상태라면 
	       %> <input type='checkbox' name='c_id' value='Y' checked='checked'>
						ID 저장 <% 
	       }else{ %> <input type='checkbox' name='c_id' value='Y'>
						ID 저장 <% 
	       } 
	       %> --%>
       </TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd" size="20"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='로그인'> 
			<input type='button' value='회원가입' onclick="location.href='${pageContext.request.contextPath }/user/agree'">
		</DIV>
		  <input type="hidden" name="flag" value="${param.flag}">
		  <input type="hidden" name="faqno" value="${faqno}"> <!-- setter로 저장된 값 -->
		  <input type="hidden" name="nowPage" value="${nowPage}"> <!-- setter로 저장된 값 -->
		  <input type="hidden" name="col" value="${param.col}">
		  <input type="hidden" name="word" value="${param.word}">
	</FORM>
</body>
</html>
