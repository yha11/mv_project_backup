<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>마이페이지</title>
</head>
<body>
<%@ include file="../ui/nav.jsp" %>

	
<div style="width: 300px; margin: 30px auto 30px auto;">
<fieldset disabled>
  <div class="mb-3">
    <label for="userId" class="form-label">아이디</label>
    <input type="text" class="form-control" id="userId" value="${user.userId}">
  </div>
</fieldset>
  <div class="mb-3">
    <label for="userName" class="form-label">이름</label>
    <input type="text" class="form-control" id="userName" value="${user.userName}">
  </div>
  <div class="mb-3">
    <label for="userEmail" class="form-label">이메일</label>
    <input type="email" class="form-control" id="userEmail" value="${user.userEmail}">
  </div>
  <button class="btn btn-primary" onclick="infomodify()">수정</button>
</div>



<%@ include file="../ui/footer.jsp" %>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

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
			userEmail : $('#userEmail').val()
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
  </body>
</html>