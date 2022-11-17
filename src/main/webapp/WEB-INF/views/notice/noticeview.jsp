<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 공지 게시물 읽기 -->
<html>
<head>
<meta charset="UTF-8">
<title>영화리뷰사이트 | 공지게시물 읽기</title>
<c:import url="/WEB-INF/views/common/import.jsp"></c:import>
</head>
<body>
	<jsp:include page="/WEB-INF/views/ui/nav.jsp"></jsp:include>
	<!-- Header-->
	
<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<td data-col="noticeNum"></td>
				<th scope="col">제목</th>
				<td data-col="noticeTitle"></td>
				<th scope="col">작성자</th>
				<td data-col="noticeWriter"></td>
				<th scope="col">작성시간</th>
				<td data-col="noticeDate"></td>
				<th scope="col">조회수</th>
				<td data-col="noticeCnt"></td>
			</tr>
			<tr>
				<td colspan="2" data-col="noticeContent"></td>
			</tr>
		</thead>
	</table>
<button onclick="location.href='/views/notice/noticelist'">목록</button>

	<script>
		$(document).ready(function() {
			getView();
		})

		function getView() {
			$.ajax({
				type : 'GET',
				url : '/noticeView/${param.noticeNum}',
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

	</script>	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/ui/footer.jsp"></jsp:include>
	
</body>
</html>