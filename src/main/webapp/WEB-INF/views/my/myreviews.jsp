<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>마이페이지</title>

    <!-- 부트스트랩 -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%@ include file="../ui/nav.jsp" %>

<div id="div"></div>

<%@ include file="../ui/footer.jsp" %>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		getreviews();
	})
	
	function getreviews() {
		$.ajax({
			url : '/myreviews',
			type : 'GET',
			accept : "application/json",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(res) {
				console.log(res);
				
				let html = '';
				let list = res.list;
				
				for(let i=0; i<list.length; i++) {
					const board = list[i];
					console.log(board);
					
					html += '<div class="card mb-3" style="max-width: 540px; margin: 30px auto 30px auto;">';
					html += '<div class="row g-0">';
					html += '<div class="col-md-4">';
					html += '<img src="' + board.image + '" class="img-fluid rounded-start" alt="' + board.title + '">';
					html += '</div>';
					html += '<div class="col-md-8">';
					html += '<div class="card-body">';
					html += '<h5 class="card-title">' + board.title + '</h5>';
					
					var starrate = board.reviewStarrate;
	    			
	    			for(var j=0; j<starrate; j++) {
	    				html += '<img class="star" src="../../resources/img/starrate.png">';
	    			}
	    			
	    			for(var j=starrate; j<5; j++) {
	    				html += '<img class="nonstar" src="../../resources/img/starrate.png">';
	    			}
					
					html += '<p class="card-text">' + board.reviewContent + '</p>';
					html += '<p class="card-text"><small class="text-muted">' + board.reviewDate + '</small></p>';
					html += '</div>';
					html += '<input type="hidden" id="reviewNum" value="' + board.reviewNum + '">';
					html += '<div style="width: 300px; margin: 30px auto 30px auto; text-align: right;">';
					html += '<button type="button" class="btn btn-danger" onclick="delReview()">삭제</button>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
				}
				$('#div').html(html);
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
				location.href='myreviews';
			},
			error: function(error) {
				console.log(error);
			}
			
		})
	}
</script>

  </body>
</html>