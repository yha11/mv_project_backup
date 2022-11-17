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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%@ include file="../ui/nav.jsp"%>

<table class="table">
  <thead>
    <tr>
      <th scope="col">리뷰 번호</th>
      <th scope="col">회원 아이디</th>
      <th scope="col">영화</th>
      <th scope="col">별점</th>
      <th scope="col">관람평</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody id="tbody"></tbody>
</table>

<%@ include file="../ui/footer.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>
<script>
		$(document).ready(function(){
			getreviews();
		})
		
		function getreviews() {
			$.ajax({
				url : '/allreviews',
				type : 'GET',
				accept : "application/json",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success : function(res) {
					console.log(res);
					let html = '';
					let list = res.list;
					for(let i=0; i<list.length; i++) {
						const review = list[i];
						console.log(review);
						
						html += '<tr>';
						html += '<th scope="row">' + review.reviewNum + '</th>';
						html += '<td>' + review.userId + '</td>';
						html += '<td>' + review.title + '</td>';
						html += '<td>' + review.reviewStarrate + '</td>';
						html += '<td>' + review.reviewContent + '</td>';
						html += '<input type="hidden" id="reviewNum" value="' + review.reviewNum + '">';
						html += '<td><button type="button" class="btn btn-danger" onclick="delReview()">삭제</button></td>';
						html += '</tr>';
					}
					$('tBody').html(html);
				},
				error: function(error) {
					console.log(error);
				}
			})
		}
		
		function delReview() {
			var data = {
					reviewNum : $('#reviewNum').val()
			}
			
			$.ajax({
				url : '/delreview',
				type : 'POST',
				accept : "application/json",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(data),
				dataType: "json",
				success : function(res) {
					console.log(res);
					alert('리뷰가 삭제되었습니다.');
					location.href='allreview';
				},
				error: function(error) {
					console.log(error);
				}
				
			})
		}
	</script>
</body>
</html>