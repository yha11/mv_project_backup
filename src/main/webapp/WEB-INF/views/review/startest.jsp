<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
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
	
	<div id="div"></div>
	
	
	
	<div style="width: 100px; margin: 30px auto 30px auto;">
		<button onclick="writeReview()">관람평 남기기</button>
	</div>
	
	

	<%@ include file="../ui/footer.jsp"%>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

	<script>
		var starrate = 5;
		var html ='';
		
		for(var i=0; i<starrate; i++) {
			html += '<img class="star" src="../../resources/img/starrate.png">';
		}
		
		for(var i=starrate; i<5; i++) {
			html += '<img class="nonstar" src="../../resources/img/starrate.png">';
		}
		
		$('#div').html(html);
	</script>

</body>
</html>