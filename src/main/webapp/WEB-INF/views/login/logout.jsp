<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 로그아웃 -->
<html>
<head>
<meta charset="UTF-8">
<title>영화리뷰사이트 | 로그아웃</title>
</head>
<body>
	<%
		session.invalidate(); 
		response.sendRedirect("login");
	%>
</body>
</html>