<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>무비피아 | 문의하기</title>
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
		<div style="width: 500px; margin: 30px auto 30px auto;">
			<div class="mb-3 row">
			    <label for="userId" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">아이디</label>
			    <div class="col-sm-10">
			      <input type="text" readonly class="form-control-plaintext" id="userId" value="${userId}">
			    </div>
		  	</div>
			<div class="mb-3 row">
			    <label for="qnaTitle" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">제목</label>
			    <div class="col-sm-10">
			    <input type="text" class="form-control" id="qnaTitle">
			    </div>
		  	</div>
		  	<div class="mb-3 row">
			    <label for="qnaContent" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">내용</label>
			    <div class="col-sm-10">
			    <textarea class="form-control" id="qnaContent" rows="3" style="height: 200px"></textarea>
			    </div>
		  	</div>
			<div style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<button type="button" class="btn btn-primary" style="border-radius: 20px;" onclick="qna()">문의하기</button>
			</div>
		</div>
	</c:when>
</c:choose>

<script>
	function qna() {
		//유효성 검사
		//제목이 공백제거후 1글자 미만일때
		if($('#qnaTitle').val().trim().length<1) {
			alert('제목을 입력해주세요.');
			$('#qnaTitle').focus();
			return;
		}
		//내용이 공백제거후 1글자 미만일때
		if($('#qnaContent').val().trim().length<1) {
			alert('내용을 입력해주세요.');
			$('#qnaContent').focus();
			return;
		}
		
		/* var param = {
				qnaTitle : $('#qnaTitle').val(),
				qnaContent : $('#qnaContent').val()
		} */
		
		var data = {};
		$('[id]').each(function(idx, item) {
			data[item.id] = item.value;
		})
		
		$.ajax({
			url : '/addqna',
			type : 'POST',
			accept : "application/json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json",
			success : function(res) {
				console.log(res);
				alert('문의가 등록되었습니다.');
				location.href='myqna?page=1&pageSize=10';
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