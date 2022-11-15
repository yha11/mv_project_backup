<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 리뷰 글 읽기 -->
<html>
<head>
<meta charset="UTF-8">
<title>영화리뷰사이트 | 리뷰게시물 읽기</title>
<c:import url="/WEB-INF/views/common/import.jsp"></c:import>
</head>
<body>
	<jsp:include page="/WEB-INF/views/ui/nav.jsp"></jsp:include>
	<!-- Header-->

	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<td data-col="boardNum"></td>
			</tr>
			<tr>
				<th scope="col">별점</th>
				<td data-col="boardRated"></td>
			</tr>
			<tr>
				<th scope="col">장르</th>
				<td data-col="boardJenre"></td>
			</tr>
			<tr>
				<th scope="col">제목</th>
				<td data-col="boardTitle"></td>
			</tr>
			<tr>
				<th scope="col">작성자</th>
				<td data-col="boardWriter"></td>
			</tr>
			<tr>
				<th scope="col">추천수</th>
				<td data-col="boardRcmdNum"></td>
			</tr>
			<tr>
				<th scope="col">작성시간</th>
				<td data-col="boardDate"></td>
			</tr>
			<tr>
				<th scope="col">조회수</th>
				<td data-col="boardCnt"></td>
			</tr>
			<tr>
				<td colspan="2" data-col="boardContent"></td>
			</tr>
		</thead>
	</table>

	<script>
		$(document).ready(function() {
			getBoard();
		})

		function getBoard() {
			$.ajax({
				type : 'GET',
				url : '/ReviewBoards/${param.boardNum}',
				accept : "application/json",
				success : function(res) {
					const keys = Object.keys(res);
					for (let i = 0; i < keys.length; i++) {
						const key = keys[i];
						$('[data-col="' + key + '"]').html(res[key]);
					}
				}
			})
		}

		function goBoardView(boardNum) {
			location.href = '/views/review-board/read?boardNum=' + boardNum;
		}
	</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/ui/footer.jsp"></jsp:include>
</body>
</html>