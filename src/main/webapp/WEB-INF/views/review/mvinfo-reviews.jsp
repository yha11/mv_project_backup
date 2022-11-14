<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<%@ include file="../ui/nav.jsp"%>

<div class="card mb-3" style="max-width: 700px; margin: 30px auto 30px auto;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_103_1.jpg" class="img-fluid rounded-start" alt="블랙 팬서: 와칸다 포에버">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h1 class="card-title">블랙 팬서: 와칸다 포에버</h1>
		<div class="container text-center">
		  <div class="row" style="text-align: left;">
		    <div class="col">
		      평점
		    </div>
		    <div class="col">
		      예매율
		    </div>
		    <div class="col">
		      누적관객수
		    </div>
		  </div>
		  <hr>
		</div>
		<div style="max-width: 400px; margin: 0px auto 30px auto;">
        <p class="card-text"><small class="text-muted">장르</small></p>
        <p class="card-text"><small class="text-muted">개봉</small></p>
        <p class="card-text"><small class="text-muted">분</small></p>
        <p class="card-text"><small class="text-muted">감독</small></p>
        <p class="card-text"><small class="text-muted">출연</small></p>
        </div>
      </div>
    </div>
  </div>
</div>

<div style="max-width: 700px; margin: 30px auto 30px auto;">
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <button id="synopsis" class="nav-link active" aria-current="page" onclick="getSynopsis()">영화정보</button>
	  </li>
	  <li class="nav-item">
	    <button id="reviews" class="nav-link" onclick="getReviews()">평점 및 관람평</button>
	  </li>
	</ul>
</div>

<div style="max-width: 650px; margin: 30px auto 30px auto;">
	<div id="div"></div>
</div>

	<%@ include file="../ui/footer.jsp"%>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		getSynopsis();
	})
	
	function getSynopsis() {
		$('#div').html('시놉시스');
		$("#reviews").removeClass("active");
	    $("#synopsis").addClass("active");
	}
	
	function getReviews() {
		$('#div').html('평점 및 관람평');
		$("#synopsis").removeClass("active");
	    $("#reviews").addClass("active");
	}
</script>	
</body>
</html>