<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>무비피아 | MY리뷰</title>
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

<div id="div"></div>

<script>
	$(document).ready(function() {
		getreviews();
	})
	
	function getreviews(page) {
		if(!(page > 0)){
			page = 1;
		}
		
		var page = page?page:1; //현재 페이지
		
		var data = {
				page : page,
				pageSize : 2
		}
		$.ajax({
			url : '/myreviews',
			type : 'GET',
			accept : "application/json",
			contentType : "application/json; charset=utf-8",
			data: data,
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
					html += '<button type="button" class="btn btn-danger" onclick="delReview(' + board.reviewNum + ')">삭제</button>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					
				}
				//페이지 버튼
				html += '<div style="max-width: 540px; margin: 30px auto 30px auto;">';
				html += '<nav aria-label="Page navigation example">';
				html += '<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">';
				html += '<ul class="pagination">';
				if(page-1 > 0) {
					html += '<li class="page-item">';
					html += '<a class="page-link" href="javascript:void(0)" onclick="getreviews(' + (page-1) + ')" aria-label="Previous">';
				}else {
					html += '<li class="page-item disabled">';
					html += '<a class="page-link" href="#" aria-label="Previous">';
				}
				html += '<span aria-hidden="true">&laquo;</span>';
				html += '</a>';
				html += '</li>';
				if(res.nextPage > 0) {
					html += '<li class="page-item">';
					html += '<a class="page-link" href="javascript:void(0)" onclick="getreviews(' + (page+1) + ')" aria-label="Next">';
				}else {
					html += '<li class="page-item disabled">';
					html += '<a class="page-link" href="#" aria-label="Next">';
				}
				html += '<span aria-hidden="true">&raquo;</span>';
				html += '</a>';
				html += '</li>';
				html += '</ul>';
				html += '</div>';
				html += '</nav>';
				html += '</div>';
				
				$('#div').html(html);
			},
			error: function(error) {
				console.log(error);
			}
			
		})
	}
	
	function delReview(reviewNum) {
		var data = {
				reviewNum : reviewNum
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
				location.href='/views/my/myreviews?page=' + ${param.page} + '&pageSize=2';
			},
			error: function(error) {
				console.log(error);
			}
			
		})
	}
</script>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>