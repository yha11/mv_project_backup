<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 리뷰 게시판 페이지 -->
<html>
<head>
	
<meta charset="UTF-8">
<title>영화리뷰사이트 | 리뷰게시판</title>
<c:import url="/WEB-INF/views/common/import.jsp"></c:import>
</head>


<body>
<jsp:include page="/WEB-INF/views/ui/nav.jsp"></jsp:include>
<!-- Header-->

<div class="col-sm-7">
         <table class="table table-striped">
           <thead>
             <tr>
              <th class="text-center">번호</th>
              <th class="text-center">별점</th>
              <th class="text-center">장르</th>
              <th class="text-center">제목</th>
              <th class="text-center">작성자</th>
              <th class="text-center">추천수</th>
              <th class="text-center">작성시간</th>
              <th class="text-center">조회수</th>
             </tr>
           </thead>
           <tbody id="list">
           </tbody>
         </table>
</div>

<button onclick="location.href='/views/review-board/write'">글작성</button>
<div id="totalDiv"></div>
<script>
	$(document).ready(function(){
		getBoards();
	})
	
	function getBoards(){
		const data = {
				page : 1,
				pageSize : 10
		}
		
		$.ajax({
			type:'GET',
			url:'/reviewBoards',
			data : data,
			accept: "application/json",
			success:function(res){
				$('#totalDiv').html('총갯수:' + res.total);
				let html = '';
				let list = res.list;
				for(let i=0;i<list.length;i++){
					const board = list[i];
					console.log(board);
					html += '<tr style="cursor:pointer" onclick="goBoardView(' + board.boardNum + ')">';
					html += '<th scope="row">' + board.boardNum + '</th>';
					html += '<td>' + board.boardRated + '</td>';
					html += '<td>' + board.boardJenre + '</td>';
					html += '<td>' + board.boardTitle + '</td>';
					html += '<td>' + board.boardWriter + '</td>';
					html += '<td>' + board.boardRcmdNum + '</td>';
					html += '<td>' + board.boardDate + '</td>';
					html += '<td>' + board. boardCnt + '</td>';
					html += '</tr>';
				}
				console.log(html);
				$('#list').html(html);
			},
			error : function(err){
				console.log(err);
			}
		})
	}
	
	function goBoardView(boardNum){
		location.href='/views/review-board/read?boardNum=' + boardNum;
	}

</script>
<!-- footer -->
   <jsp:include page="/WEB-INF/views/ui/footer.jsp"></jsp:include>
</body>
</html>