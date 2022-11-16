<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<title>마이페이지</title>
</head>
<body>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<%@ include file="../ui/nav.jsp"%>

	<div class="card text-center"
		style="width: 650px; margin: 30px auto 30px auto;">
		
		<c:choose>
			<c:when test="${user.role=='ROLE_USER'}">
			 	<div class="card-header">일반 회원</div>
			 	<div class="card-body">
					<h5 class="card-title">${user.userName}님 반가워요!</h5>
					<p class="card-text">오늘은 어떤 영화를 보셨나요?</p>
					<a href="#" class="btn btn-primary" style="border-radius: 20px;">리뷰쓰기</a>
				</div>
				<div class="card-footer text-muted">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="myreviews">MY 리뷰</a></li>
						<li class="nav-item"><a class="nav-link" href="myqna">1:1 문의</a></li>
						<li class="nav-item"><a class="nav-link" href="infomodify">정보 관리</a></li>
					</ul>
				</div>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${user.role=='ROLE_ADMIN'}">
			 	<div class="card-header">관리자</div>
			 	<div class="card-body">
					<h5 class="card-title">${user.userName}님</h5>
					<p class="card-text">관리자 페이지입니다.</p>
				</div>
				<div class="card-footer text-muted">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="../admin/allreview">리뷰 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="../admin/allqna">문의 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="infomodify">정보 관리</a></li>
					</ul>
				</div>
			</c:when>
		</c:choose>
	</div>

	<%@ include file="../ui/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>