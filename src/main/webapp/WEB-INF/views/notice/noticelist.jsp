<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<!-- 공지 게시판 리스트 -->
<html>
<head>
<meta charset="UTF-8">
<title>무비피아 | 공지사항</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<div style="width: 800px; margin: 30px auto 30px auto;">
		<table class="table">
			<thead class="table-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성시간</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody id="tBody"></tbody>
		</table>

		<div
			style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<button class="btn btn-primary" style="border-radius: 20px;"
				onclick="location.href='/views/notice/addnotice'">글작성</button>
		</div>
	</div>
	<!-- 페이징 -->
	<div style="width: 1000px; margin: 30px auto 30px auto;">
		<nav aria-label="Page navigation example">
			<div
				style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<ul class="pagination" id="pagination">
				</ul>
			</div>
		</nav>
	</div>

	<script>
		
		
	$(document).ready(function(){
		getList();
	})
	
	function getList(page){
		if(!(page > 0)){
			page = 1;
	}
		
	var page = page?page:1; //현재 페이지
		
		let pageSize = 10; //밑에 보여야 하는 페이지 갯수
		let fPage = Math.floor((page-1)/pageSize) * pageSize + 1;  //밑에 보여야하는 시작 페이지
		let lPage = fPage + pageSize -1; //밑에 보여야 하는 종료 페이지
		
		var data = {
				page : page,
				pageSize : pageSize
		}
		
		/*
		form 태그의 submit으로 데이터를 서버로 보낼 경우는 동기 방식
		ajax를 활용해서 브라우저는 가만히 있는 상태에서 데이터만 보내고 받는 경우가 비동기 방식
		json
		*/
		$.ajax({
			url : '/noticeList',
			type: 'GET',
			accept : "application/json",
			contentType: "application/json; charset=utf-8",
			data: data,
			dataType: "json",
			success: function(res) {
				console.log(res);
				let html = '';
				let list = res.list; //페이징할때 필요하고 안할땐 필요없음
				for(let i=0; i<list.length; i++) {
					const board = list[i];
					html += '<tr style="cursor:pointer" onclick="goNoticeView(' + board.noticeNum + ')">';
					html += '<th scope="row">' + board.noticeNum + '</th>';
					html += '<td>' + board.noticeTitle + '</td>';
					html += '<td>' + board.noticeWriter + '</td>';
					html += '<td>' + board.noticeDate + '</td>';
					html += '<td>' + board.noticeCnt + '</td>';
					html += '</tr>';
				}
				$('tBody').html(html);
				
				let pageHtml = '';
		        // << 페이지버튼
		        if(page-1 > 0) {
		        	pageHtml += '<li class="page-item">';
		        	pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="getList(' + (page-1) + ')" aria-label="Previous">';
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
			        pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="getList(' + i + ')">' + i + '</a>';
			        pageHtml += '</li>';
		        }
		        // >> 페이지버튼
		        if(res.nextPage > 0) {
		        	pageHtml += '<li class="page-item">';
		        	pageHtml += '<a class="page-link" href="javascript:void(0)" onclick="getList(' + (page+1) + ')" aria-label="Next">';
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
	
	/* function getList(){
		const data = {
				page : 1,
				pageSize : 10
		}
		
		$.ajax({
			type:'GET',
			url:'/noticelist',
			data : data,
			accept: "application/json",
			success:function(res){
				$('#totalDiv').html('총갯수:' + res.total);
				let html = '';
				let list = res.list;
				for(let i=0;i<list.length;i++){
					const board = list[i];
					console.log(board);
					html += '<tr style="cursor:pointer" onclick="goNoticeView(' + board.noticeNum + ')">';
					html += '<th scope="row">' + board.noticeNum + '</th>';
					html += '<td>' + board.noticeTitle + '</td>';
					html += '<td>' + board.noticeWriter + '</td>';
					html += '<td>' + board.noticeDate + '</td>';
					html += '<td>' + board.noticeCnt + '</td>';
					html += '</tr>';
				}
				console.log(html);
				$('#list').html(html);
			},
			error : function(err){
				console.log(err);
			}
		})
	} */
	
	function goNoticeView(noticeNum){
		location.href='/views/notice/noticeview?noticeNum=' + noticeNum;
	}

</script>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>