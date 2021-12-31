<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
	<div class="container mt-5 text-center" style="border: 1px solid black; border-radius: 1rem;">
	<h2 class="mt-3 mb-3">M e m b e r L i s t</h2>
	<table class="table table-hover text-center">
		<tr>
			<th>회원번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>상세조회</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${mList}" var="m">
			<tr>
				<td>${m.m_number}</td>
				<td>${m.m_id}</td>
				<td>${m.m_name}</td>
				<td>${m.m_phone}</td>
				<td><a class="btn btn-outline-dark" href="/member/detail?m_number=${m.m_number}">V i e w</a></td>
				<td><a class="btn btn-outline-dark" href="/member/delete?m_number=${m.m_number}">D e l e t e</a></td>
			</tr>
		</c:forEach>
	</table>
		<a class="btn btn-outline-danger mb-3" href="/member/cancle?m_number=${sessionScope.loginNumber}">C a n C l e</a>
	</div>
</body>
</html>