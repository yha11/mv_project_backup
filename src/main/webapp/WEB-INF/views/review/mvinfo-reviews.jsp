<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세보기</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
<style>
	.star {
		background-color: #ffc400;
		width: 20px;
	}
	.nonstar {
		background-color: #f0f0f0;
		width: 20px;
	}
	
</style>
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<%@ include file="../ui/nav.jsp"%>
	
<div style="width: 800px; margin: 30px auto 30px auto;">
	<div class="dropdown">
	  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	    영화
	  </button>
	  <ul id="alltitle" class="dropdown-menu">
	    	<!-- 넣을 부분 -->
	  </ul>
	</div>
</div>

<div class="container text-center" style="width: 1000px;">
			  <ul class="nav justify-content-center">
				  <li class="nav-item">
				    <button type="button" class="btn btn-secondary" id="synopsis" aria-current="page" onclick="getSynopsis()">영화 정보</button>
				  </li>
				  <li class="nav-item">
				    <button type="button" class="btn btn-light" id="reviews" onclick="getReviews()">평점 및 관람평</button>
				  </li>
				</ul>
			  
			  <div id="div">
			  <!-- 바뀔 부분 시작 -->
			  
			  <!-- 바뀔 부분 끝 -->
			  </div>
			  
			</div>
		  </div>


	<%@ include file="../ui/footer.jsp"%>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		getMovieTitle();
		getSynopsis();
	})
	
	function getMovieTitle() {
		$.ajax({
			url : '/allmovietitle',
			type : 'GET',
		    accept : "application/json",
		    contentType : "application/json; charset=utf-8",
		    dataType : "json",
		    success : function(res) {
		    	console.log(res);
		    	let html = '';
		    	
		    	for(let i=0; i<res.length; i++) {
		    		const title = res[i];
		    		html += '<li><a class="dropdown-item" href="mvinfo-reviews?movieNum=' + title.movieNum + '">' + title.title + '</a></li>';
		    	}
		    	$('#alltitle').html(html);
		    }
		})
	}
	
	function getSynopsis() {
	    
	    $.ajax({
	    	url : '/movie/${param.movieNum}',
	    	type : 'GET',
	    	accept : "application/json",
	    	contentType: "application/json; charset=utf-8",
	    	dataType: "json",
	    	success : function(res) {
	    		console.log(res);
	    		let html = '';
	    		
	    		var title = res.title;
	    		var rank = res.rank;
	    		var image = res. image;
	    		var percent = res.percent;
	    		
	    		html += '<div class="col-10" style="max-width: 700px; margin: 30px auto 30px auto;">';
	    		html += '<div class="card mb-3">';
	    		html += '<div class="row g-0">';
	    		html += '<div class="col-md-4">';
	    		html += '<img src="' + image +'" class="img-fluid rounded-start" alt="' + title + '">';
	    		html += '</div>';
	    		html += '<div class="col-md-8">';
	    		html += '<div class="card-body">';
	    		html += '<h1 class="card-title">' + title + '</h1>';
	    		html += '<div class="container text-center">';
	    		html += '<hr>';
	    		html += '</div>';
	    		html += '<div style="max-width: 400px; margin: 0px auto 30px auto;">';
	    		html += '<p class="card-text" style="text-align: left;"><small class="text-muted">순위 ' + rank + '</small></p>';
	    		html += '<p class="card-text" style="text-align: left;"><small class="text-muted">예매율 ' + percent + '</small></p>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		html += '</div>';
	    		
	    		$('#div').html(html);
	    		$("#synopsis").removeClass("btn btn-light");
	    	    $("#synopsis").addClass("btn btn-secondary");
	    	    $("#reviews").removeClass("btn btn-secondary");
	    	    $("#reviews").addClass("btn btn-light");
	    		
	    	},
			error : function(error) {
				console.log(error);
			}
	    })
	}
	
	function getReviews() {
	    
	    $.ajax({
	    	url : '/reviews/${param.movieNum}',
	    	type : 'GET',
	    	accept : "application/json",
	    	contentType: "application/json; charset=utf-8",
	    	dataType: "json",
	    	success : function(res) {
	    		console.log(res);
	    		
	    		let html = '';
	    		let list = res.list;
	    		
	    		for(let i=0; i<list.length; i++) {
	    			const reviews = list[i];
	    			console.log(reviews);
	    			html += '<div class="container text-center">';
	    			html += '<div class="row" style="width: 700px; margin: 30px auto 30px auto;">';
	    			html += '<div class="col" style="text-align: left;">' + reviews.userName + '</div>';
	    			html += '<div class="col" style="text-align: right;">' + reviews.reviewDate + '</div>';
	    			html += '</div>';
	    			html += '<div class="row" style="width: 700px; margin: 30px auto 30px auto;">';
	    			html += '<div class="col" style="text-align: left;">';
	    			
	    			var starrate = reviews.reviewStarrate;
	    			
	    			for(var j=0; j<starrate; j++) {
	    				html += '<img class="star" src="../../resources/img/starrate.png">';
	    			}
	    			
	    			for(var j=starrate; j<5; j++) {
	    				html += '<img class="nonstar" src="../../resources/img/starrate.png">';
	    			}
	    			
	    			html += '</div>';
	    			html += '</div>';
	    			html += '<div class="row" style="width: 700px; margin: 30px auto 30px auto;">';
	    			html += '<div class="col" style="text-align: left;">' + reviews.reviewContent + '</div>';
	    			html += '</div>';
	    			html += '</div>';
	    			html += '<hr>';
	    			
	    		}
	    		html += '<div style="width: 100px; margin: 30px auto 30px auto;">';
    			html += '<button class="btn btn-primary" onclick="writeReview()">관람평 남기기</button>';
    			html += '</div>';
    			
	    		$('#div').html(html);
	    		$("#reviews").removeClass("btn btn-light");
	    	    $("#reviews").addClass("btn btn-secondary");
	    	    $("#synopsis").removeClass("btn btn-secondary");
	    	    $("#synopsis").addClass("btn btn-light");
	    		
	    },
	    error : function(error) {
			console.log(error);
	}
	    
	})
	}
	
	function writeReview(movieNum) {
		location.href = '/views/review/review?movieNum=' + '${param.movieNum}';
	}
	
	
</script>
</body>
</html>