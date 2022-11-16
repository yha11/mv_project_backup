<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
</head>
<body>
<%@ include file="../ui/nav.jsp"%>

		<c:choose>
			<c:when test="${empty user}">
				<div style="width: 650px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
					<div class="alert alert-danger" role="alert">
					  로그인 후 사용 가능합니다.
					</div>
				</div>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${user.role==0}">
				<div class="card text-center" style="width: 650px; margin: 30px auto 30px auto;">
			 	<div class="card-header">일반 회원</div>
			 	<div class="card-body">
					<h5 class="card-title">${user.userName}님 반가워요!</h5>
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
			<c:when test="${user.role==1}">
				<div class="card text-center" style="width: 650px; margin: 30px auto 30px auto;">
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
				</div>
			</c:when>
		</c:choose>
	
<%@ include file="../ui/footer.jsp"%>
</body>
</html>