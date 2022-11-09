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
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
<%@ include file="../ui/nav.jsp" %>

	
<form style="width: 300px; margin: 30px auto 30px auto;">
<fieldset disabled>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">아이디</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="test1234">
  </div>
</fieldset>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1" aria-describedby="emailHelp" >
    <div id="emailHelp" class="form-text">8글자 이상 입력해주세요.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">이름</label>
    <input type="text" class="form-control" id="exampleInputPassword1" value="홍길동">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">전화번호</label>
    <input type="tel" class="form-control" id="exampleInputPassword1" value="010-0000-0000">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">이메일</label>
    <input type="email" class="form-control" id="exampleInputPassword1" value="hong@naver.com">
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">수정</button>
</form>



<%@ include file="../ui/footer.jsp" %>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>