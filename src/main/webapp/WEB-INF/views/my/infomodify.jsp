<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>무비피아 | 마이페이지</title>
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
		<div style="width: 300px; margin: 30px auto 30px auto;">
		<fieldset disabled>
		  <div class="mb-3">
		    <label for="userId" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="userId" value="${userId}">
		  </div>
		</fieldset>
		  <div class="mb-3">
		    <label for="userName" class="form-label">이름</label>
		    <input type="text" class="form-control" id="userName" value="${userName}">
		  </div>
		  <div class="mb-3">
		    <label for="userEmail" class="form-label">이메일</label>
		    <input type="email" class="form-control" id="userEmail" value="${email}">
		  </div>
		  <button class="btn btn-primary" onclick="infomodify()">수정</button>
		</div>
	</c:when>
</c:choose>
	
<script>
function infomodify(){
	/*
	form 태그의 submit으로 데이터를 서버로 보낼 경우는 동기 방식
	ajax를 활용해서 브라우저는 가만히 있는 상태에서 데이터만 보내고 받는 경우가 비동기 방식
	json
	*/
	
	//const는 상수입니다.
	var param = {
			userId : $('#userId').val(),
			userName : $('#userName').val(),
			email : $('#userEmail').val()
	}
	//userId, password
		$.ajax({
			url : '/user/modify',
			type: 'POST',
			accept: "application/json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(param),
			dataType: "json",
			success: function(res) {
				console.log(res)
				alert('정보 수정에 성공하였습니다.');
				location.href='mypage';
			  },
			error: function(error) {
				  console.log(error);
			  },
			
		});
}

</script>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>