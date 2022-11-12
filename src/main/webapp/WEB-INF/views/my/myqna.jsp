<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>마이페이지-내 문의</title>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

</head>
<body>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<%@ include file="../ui/nav.jsp"%>



	<div style="width: 800px; margin: 30px auto 30px auto;">
		<table class="table">
			<thead class="table-light">
				<tr>
					<th scope="col" colspan="4" style="text-align: center;">질문</th>
				</tr>
			</thead>
			<tbody>
				<tr onclick="">
					<th scope="row">1</th>
					<td>질문제목1-안녕하세요 리뷰 수정에 관한 질문입니다.</td>
					<td>답변 완료</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>질문제목2</td>
					<td>답변 미완료</td>
				</tr>
			</tbody>
		</table>
		<div
			style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<button class="btn btn-primary" style="border-radius: 20px;"
				onclick="location.href='qna'">문의하기</button>
		</div>
	</div>



	<%@ include file="../ui/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

	<script>
	$(document).ready(function(){
		qnalist();
	})

	function qnalist(){
		/*
		form 태그의 submit으로 데이터를 서버로 보낼 경우는 동기 방식
		ajax를 활용해서 브라우저는 가만히 있는 상태에서 데이터만 보내고 받는 경우가 비동기 방식
		json
		*/
		$.ajax({
			url : '/qnaboard',
			type: 'GET',
			data: JSON.stringify(param),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function(resp) {
				console.log(resp);
			},
			error: function(error) {
				console.log(error);
			}
		})
	}
</script>


</body>
</html>