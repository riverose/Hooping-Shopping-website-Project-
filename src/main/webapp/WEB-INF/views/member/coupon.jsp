<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/ping/resources/css/style.css" rel="stylesheet">

</head>
<body>
<h1 style="text-align: center; margin-top: 10%;"> 쿠폰 리스트 </h1>
<table class="table project-table table-centered table-nowrap">
	<thead>
		<tr>
			<th scope="col">쿠폰명</th>
			<th scope="col">할인 가격</th>
		</tr>
	</thead>
	<c:forEach items="${cList }" var="coupon">
		<tbody>
		<tr>
			<td class="text_ct">${coupon.couponName }</td>
			<td class="text_ct">${coupon.couponPrice }</td>
		</tr>
		</tbody>
	</c:forEach>
</table>

</body>
</html>