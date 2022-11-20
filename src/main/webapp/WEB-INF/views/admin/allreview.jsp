<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<hr>
<!-- 검색창 -->
<div style="width: 1000px; margin: 30px auto 30px auto;">
	<div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
		<select id="searchObj">
			<option value="userId">아이디</option>
			<option value="title">영화</option>
			<option value="reviewContent">관람평</option>
		</select>&nbsp;
		<input type="text" id="searchStr" placeholder="검색어를 작성해주세요.">&nbsp;
		<button type="button" onclick="getReviews()">검색</button>
	</div>
</div>

<table class="table">
  <thead class="table-light">
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
<!-- 페이징 -->
<div style="width: 1000px; margin: 30px auto 30px auto;">	
  <nav aria-label="Page navigation example">
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<ul class="pagination" id="pagination">
		</ul>
	</div>
  </nav>
</div>

<script>
$(document).ready(function(){
	getReviews();
})

function getReviews(page) {
	if(!(page > 0)){
		page = 1;
	}
	
	var page = page?page:1; //현재 페이지
	
	let pageSize = 10; //밑에 보여야 하는 페이지 갯수
	let fPage = Math.floor((page-1)/pageSize) * pageSize + 1;  //밑에 보여야하는 시작 페이지
	let lPage = fPage + pageSize -1; //밑에 보여야 하는 종료 페이지
	
	var data = {
			page : page,
			pageSize : pageSize,
			searchObj : $('#searchObj').val(),
			searchStr : $('#searchStr').val(),
			
	}
	
	$.ajax({
		url : '/allreviews',
		type : 'GET',
		accept : "application/json",
		contentType: "application/json; charset=utf-8",
		data : data,
		dataType: "json",
		success : function(res) {
			console.log(res);
			
			let html = '';
			let list = res.list;
			for(let i=0; i<list.length; i++) {
				const review = list[i];
				
				html += '<tr>';
				html += '<th scope="row">' + review.reviewNum + '</th>';
				html += '<td>' + review.userId + '</td>';
				html += '<td>' + review.title + '</td>';
				html += '<td>' + review.reviewStarrate + '</td>';
				html += '<td>' + review.reviewContent + '</td>';
				html += '<input type="hidden" id="reviewNum" value="' + review.reviewNum + '">';
				html += '<td><button type="button" class="btn btn-danger" onclick="delReview(' + review.reviewNum + ')">삭제</button></td>';
				html += '</tr>';
			}
			$('tBody').html(html);
			
			let pageHtml = '';
	        // << 페이지버튼
	        if(page-1 > 0) {
	        	pageHtml += '<li class="page-item">';
	        	pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="getReviews(' + (page-1) + ')" aria-label="Previous">';
	        }else {
	        	pageHtml += '<li class="page-item disabled">';
		        pageHtml += '<a class="page-link" href="#" aria-label="Previous">';
	        }
	        pageHtml += '<span aria-hidden="true">&laquo;</span>';
	        pageHtml += '</a>';
	        pageHtml += '</li>';
	        // 페이지 버튼
	        for(let i=fPage; i<=res.pages; i++){
		        pageHtml += '<li class="page-item">';
		        pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="getReviews(' + i + ')">' + i + '</a>';
		        pageHtml += '</li>';
	        }
	        // >> 페이지버튼
	        if(res.nextPage > 0) {
	        	pageHtml += '<li class="page-item">';
	        	pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="getReviews(' + (page+1) + ')" aria-label="Next">';
	        }else {
	        	pageHtml += '<li class="page-item disabled">';
		        pageHtml += '<a class="page-link" href="#" aria-label="Next">';
	        }
	        
	        pageHtml += '<span aria-hidden="true">&raquo;</span>';
	        pageHtml += '</a>';
	        pageHtml += '</li>';
	        $('#pagination').html(pageHtml);
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
			location.href='/views/admin/allreview';
		},
		error: function(error) {
			console.log(error);
		}
		
	})
}

/* <select id="searchObj">
<option value="userId">아이디</option>
<option value="title">영화</option>
<option value="reviewContent">관람평</option>
</select>
<input type="text" id="searchStr" placeholder="검색어를 작성해주세요.">
<button type="button" onclick="search()">검색</button> */

/* function search() {
	var data = {
			searchObj : $('#searchObj').val(), // userId, title, reviewContent
			searchStr : $('#searchStr').val()
	}
	console.log(data);
	
	$.ajax({
		url : '/searchreview',
		type : 'POST',
		accept : "application/json",
    	contentType: "application/json; charset=utf-8",
    	data: JSON.stringify(data),
		dataType: "json",
		success : function(res) {
			console.log(res);
		},
    	error: function(error) {
			console.log(error);
		}
	})
	
} */
</script>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>