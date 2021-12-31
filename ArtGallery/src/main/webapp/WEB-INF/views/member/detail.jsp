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
	<div class="container mt-5" style="border: 1px solid black; border-radius: 1rem;">
		<h2 class="text-center">D e t a i l</h2>
		<table class="table table-hover text-center">
			<tr>
				<th>번호</th>
				<th>ID</th>
				<th>이름</th>
				<th>전화번호</th>
			</tr>
				<tr>
					<td>${member.m_number}</td>
					<td>${member.m_id}</td>
					<td>${member.m_name}</td>
					<td>${member.m_phone}</td>
				</tr>
		</table>
				<div class="text-center mb-3">
					<img src="/resources/upload/${member.m_filename}" style="border-radius: 1rem; width:30%;">
				</div>
		<div class="container text-center">
				<a class="btn btn-outline-danger mb-3" href="/member/memberList">M e m b e r L i s t</a>
				
				<!-- http://localhost:8080/member/detail?m_number=6 -->
				<!-- <a href="/">홈(/)</a> http://localhost:8080/ -->
				<!-- <a href="./">홈(./)</a> http://localhost:8080/member/ -->
				<!-- <a href="../">홈(../)</a> http://localhost:8080/ -->
		</div>
	</div>
</body>
</html>