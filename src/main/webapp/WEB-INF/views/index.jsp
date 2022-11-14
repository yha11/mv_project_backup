<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 | 메인화면</title>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
input[type='number'] {
	width: 42px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/ui/nav.jsp"></jsp:include>
	<!-- Header-->
	
	<header class="py-5" style="background-color: #B4C3FF">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">영화 리뷰사이트</h1>
				<p class="lead fw-normal text-white-50 mb-0">서로의 영화감상평을 공유합니다!</p>
			</div>
		</div>
	</header>

	홈입니다.
	<a href="/views/login/login">로그인</a>
	<a href="/views/my/mypage">마이페이지</a>
	<div>
		<img src="/resources/img/about.jpg" style="width: 500px; height: 300px">
		${user}
		
	</div>
	
   <!-- footer -->
   <jsp:include page="/WEB-INF/views/ui/footer.jsp"></jsp:include>
</body>
</html>