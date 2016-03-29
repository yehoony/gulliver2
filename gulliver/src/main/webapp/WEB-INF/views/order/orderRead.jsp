<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function listB(){
	var url = "./list?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}
</script>

</head>
<body>
	<br>
	<br>
	<table align="center" border="1" cellpadding="1" cellspacing="1" style="width: 900px;">

		<tr>
			<td>주문번호</td>
			<td>${dto.orderno}</td>
		</tr>
		<tr>
			<td>주문상품</td>
			<td><img src="${dto.bookfront_photo}"><br>${dto.bookname}</td>
		</tr>
		<tr>
			<td>수량</td>
			<td>${dto.order_cnt }&nbsp;권</td>
		</tr>
		<tr>
			<td>주문인</td>
			<td>${userdto.name}</td>
		</tr>
		<tr>
			<td>수령인</td>
			<td>${dto.recipient}</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${dto.del_zipcode}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${dto.del_address1}</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${dto.del_address2}</td>
		</tr>
<!-- 		<tr>
			<td>휴대전화번호</td>
			<td>010-1234-1234</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>02-123-123</td>
		</tr> -->
		<tr>
			<td>배송방법</td>
			<td>${dto.del_method}</td>
		</tr>
		<tr>
			<td>배달원에게 남기는말</td>
			<td>${dto.order_comment}</td>
		</tr>
	</table>
	<br>
	<p style="text-align: center;">
		<input name="" type="button" value="목록" onclick="listB()"/>&nbsp; 
		<input name="submit" type="submit" value="삭제" />&nbsp; 
		<input name="" type="button" value="수정" />
	</p>
</body>
</html>