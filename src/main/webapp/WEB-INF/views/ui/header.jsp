<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 부트스트랩 CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- 구글폰트 적용 -->
<style type="text/css">
body {
	font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>
<!-- 내비게이션 -->
<nav class="navbar navbar-expand-lg bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">
			<img src="/resources/img/icon.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
			무비피아
		  </a>
	  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		  <li class="nav-item">
			<a class="nav-link active" aria-current="page" href="#">사이트소개</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="#">영화 둘러보기</a>
		  </li>
		  <li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			  게시판
			</a>
			<ul class="dropdown-menu">
			  <li><a class="dropdown-item" href="#">공지사항</a></li>
			  <li><a class="dropdown-item" href="#">문의하기</a></li>
			  <li><a class="dropdown-item" href="#">자주 묻는 질문</a></li>
			</ul>
		  </li>
		</ul>
		<form class="d-flex" role="search">
		  <div class="text-end">
	          <button type="button" class="btn btn-outline-dark me-2">로그인</button>
	          <button type="button" class="btn btn-dark">회원가입</button>
          </div>
		</form>
	  </div>
	</div>
</nav>
</body>
</html>