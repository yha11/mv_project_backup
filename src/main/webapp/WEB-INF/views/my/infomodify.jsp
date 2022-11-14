<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>마이페이지</title>

    <!-- 부트스트랩 -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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