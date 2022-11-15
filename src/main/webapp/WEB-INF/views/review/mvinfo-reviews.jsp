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
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<%@ include file="../ui/nav.jsp"%>


<div class="container text-center" style="width: 1000px;">
			<div class="row">
			  <div class="col-2" style="width: 100px; margin: 30px auto 30px auto;">
				<ul class="nav flex-column nav-pills" >
					<li class="nav-item" style="margin: 30px auto 30px auto;">
					  <button class="nav-link active" id="synopsis" aria-current="page" style="width: 140px; display: flex; flex-direction: column; justify-content: center; align-items: center;">영화정보</button>
					</li>
					<li class="nav-item">
					  <button class="nav-link" id="reviews" style="width: 140px; display: flex; flex-direction: column; justify-content: center; align-items: center;">평점 및 관람평</button>
					</li>
				  </ul>
			  </div>
			  
			  <!-- 바뀔 부분 -->
			  <div class="col-10">
				<div class="card mb-3" style="max-width: 700px; margin: 30px auto 30px auto;">
					<div class="row g-0">
					  <div class="col-md-4">
						<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_103_1.jpg" class="img-fluid rounded-start" alt="블랙 팬서: 와칸다 포에버">
					  </div>
					  <div class="col-md-8">
						<div class="card-body">
						  <h1 class="card-title">블랙 팬서: 와칸다 포에버</h1>
						  <div class="container text-center">
							<hr>
						  </div>
						  <div style="max-width: 400px; margin: 0px auto 30px auto;">
						  <p class="card-text" style="text-align: left;"><small class="text-muted">순위</small></p>
						  <p class="card-text" style="text-align: left;"><small class="text-muted">예매율</small></p>
						  </div>
						</div>
					  </div>
					</div>
				  </div>
			  </div>
			</div>
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
	    
	    $.ajax({
	    	url : '/movie/${param.movieNum}',
	    	type : 'GET',
	    	accept : "application/json",
	    	contentType: "application/json; charset=utf-8",
	    	dataType: "json",
	    	success : function(res) {
	    		console.log(res);
	    		
	    		/* $('#div').html('시놉시스');
	    		$("#reviews").removeClass("active");
	    	    $("#synopsis").addClass("active"); */
	    		
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
	    			html += '<div class="col" style="text-align: left;">' + reviews.userId + '</div>';
	    			html += '<div class="col" style="text-align: right;">' + reviews.reviewDate + '</div>';
	    			html += '</div>';
	    			html += '<div class="row" style="width: 700px; margin: 30px auto 30px auto;">';
	    			html += '<div class="col" style="text-align: left;">' + reviews.reviewStarrate + '</div>';
	    			html += '</div>';
	    			html += '<div class="row" style="width: 700px; margin: 30px auto 30px auto;">';
	    			html += '<div class="col" style="text-align: left;">' + reviews.reviewContent + '</div>';
	    			html += '</div>';
	    			html += '</div>';
	    			
	    		}
	    		
	    		$('#div').html('html');
    			$("#synopsis").removeClass("active");
    		    $("#reviews").addClass("active");
	    		
	    },
	    error : function(error) {
			console.log(error);
	}
	    
	})
	}
	
	
</script>
</body>
</html>