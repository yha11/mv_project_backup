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

<c:choose>
	<c:when test="${empty userId}">
		<div style="width: 650px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<div class="alert alert-danger" role="alert">
			  로그인 후 사용 가능합니다.
			</div>
		</div>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${!empty userId}">
	<!-- 완료, 미완료 체크창 -->
	<div style="width: 800px; margin: 30px auto 30px auto;">
		<ul style="list-style: none; display: flex; flex-direction: row; justify-content: center; align-items: center;">
			<li style="float: left;"><input type="radio" name="searchObj" value="answer" onclick="qnaList()">완료</li>&nbsp;
			<li style="float: left;"><input type="radio" name="searchObj" value="unanswered" onclick="qnaList()">미완료</li>
		</ul>
	</div>
	
		<div style="width: 800px; margin: 30px auto 30px auto;">
			<table class="table">
				<thead class="table-light">
					<tr>
						<th scope="col" style="text-align: center;"></th>
						<th scope="col">문의 날짜</th>
						<th scope="col">질문</th>
						<th scope="col">답변 현황</th>
					</tr>
				</thead>
				<tbody id="tBody"></tbody>
			</table>
		</div>
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
				qnaList();
			})
		
			function qnaList(page){
				if(!(page > 0)){
					page = 1;
				}
				
				var page = page; //현재 페이지
				
				let pageSize = 10; //밑에 보여야 하는 페이지 갯수
				let fPage = Math.floor((page-1)/pageSize) * pageSize + 1;  //밑에 보여야하는 시작 페이지
				let lPage = fPage + pageSize -1; //밑에 보여야 하는 종료 페이지
				
				var data = {
						page : page,
						pageSize : pageSize,
						searchObj : $('input[name=searchObj]:checked').val()
				}
				/*
				form 태그의 submit으로 데이터를 서버로 보낼 경우는 동기 방식
				ajax를 활용해서 브라우저는 가만히 있는 상태에서 데이터만 보내고 받는 경우가 비동기 방식
				json
				*/
				$.ajax({
					url : '/allqna',
					type: 'GET',
					accept : "application/json",
					contentType: "application/json; charset=utf-8",
					data : data,
					dataType: "json",
					success: function(res) {
						console.log(res);
						let html = '';
						let list = res.list; //페이징할때 필요하고 안할땐 필요없음
						for(let i=0; i<list.length; i++) {
							const board = list[i];
							html += '<tr style="cursor:pointer" onclick="goQnaView(' + board.qnaNum + ', ' + board.userNum + ')">';
							html += '<th scope="row">' + board.qnaNum + '</th>';
							html += '<td>' + board.qnaDate + '</td>';
							html += '<td>' + board.qnaTitle + '</td>';
							html += '<td>' + board.qnaStatus + '</td>';
							html += '</tr>';
						}
						$('tBody').html(html);
						
						let pageHtml = '';
				        // << 페이지버튼
				        if(page-1 > 0) {
				        	pageHtml += '<li class="page-item">';
				        	pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="qnaList(' + (page-1) + ')" aria-label="Previous">';
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
					        pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="qnaList(' + i + ')">' + i + '</a>';
					        pageHtml += '</li>';
				        }
				        // >> 페이지버튼
				        if(res.nextPage > 0) {
				        	pageHtml += '<li class="page-item">';
				        	pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="qnaList(' + (page+1) + ')" aria-label="Next">';
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
			
			function goQnaView(qnaNum, userNum) {
				location.href='/views/my/qnadetail?qnaNum=' + qnaNum + '&userNum=' + userNum;
			}
		</script>
	</c:when>
</c:choose>


<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>