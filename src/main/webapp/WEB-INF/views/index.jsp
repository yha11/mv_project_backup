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
<!-- nav에 주석처리 하니까 메인화면에 안떠서 일단 적어뒀어요. -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
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
	<div>
		<img src="/resources/img/about.jpg" style="width: 500px; height: 300px">
		
	</div>
	
	<!-- 게시판 아래 리스트 안떠서 추가했습니다. -->
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   <!-- footer -->
   <jsp:include page="/WEB-INF/views/ui/footer.jsp"></jsp:include>
</body>
</html>