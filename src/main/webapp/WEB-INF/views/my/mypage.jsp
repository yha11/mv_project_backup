<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>무비피아 | 마이페이지</title>
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

		<c:choose>
			<c:when test="${empty userId}">
				<div style="width: 650px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
					<div class="alert alert-danger" role="alert">
					  로그인 후 사용 가능합니다.
					</div>
				</div>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${admin==0}">
				<div class="card text-center" style="width: 650px; margin: 30px auto 30px auto;">
			 	<div class="card-header">일반 회원</div>
			 	<div class="card-body">
					<h5 class="card-title">${userName}님 반가워요!</h5>
					<p class="card-text">오늘은 어떤 영화를 보셨나요?</p>
					<a href="../review/mvinfo-reviews" class="btn btn-primary" style="border-radius: 20px;">리뷰쓰기</a>
				</div>
				<div class="card-footer text-muted">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="myreviews">MY 리뷰</a></li>
						<li class="nav-item"><a class="nav-link" href="myqna">1:1 문의</a></li>
						<li class="nav-item"><a class="nav-link" href="infomodify">정보 관리</a></li>
					</ul>
				</div>
				</div>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${admin==1}">
				<div class="card text-center" style="width: 650px; margin: 30px auto 30px auto;">
			 	<div class="card-header">관리자</div>
			 	<div class="card-body">
					<h5 class="card-title">${userName}님</h5>
					<p class="card-text">관리자 페이지입니다.</p>
				</div>
				<div class="card-footer text-muted">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/views/admin/allreview">리뷰 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="/views/admin/allqna">문의 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="infomodify">정보 관리</a></li>
					</ul>
				</div>
				</div>
			</c:when>
		</c:choose>
	
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>