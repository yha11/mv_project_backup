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

<script>
	$(document).ready(function(){
		qnalist();
	})

	function qnalist(){
		var data = {
				page : ${param.page},
				pageSize : 10
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
					console.log(board);
					html += '<tr style="cursor:pointer" onclick="goQnaView(' + board.qnaNum + ', ' + board.userNum + ')">';
					html += '<th scope="row">' + board.qnaNum + '</th>';
					html += '<td>' + board.qnaDate + '</td>';
					html += '<td>' + board.qnaTitle + '</td>';
					html += '<td>' + board.qnaStatus + '</td>';
					html += '</tr>';
				}
				$('tBody').html(html);
			},
			error: function(error) {
				console.log(error);
			}
		})
	}
	
	function goQnaView(qnaNum, userNum) {
		location.href='/views/my/qnadetail?qnaNum=' + qnaNum + '&userNum=' + userNum + '&page=' +${param.page};
	}
</script>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>