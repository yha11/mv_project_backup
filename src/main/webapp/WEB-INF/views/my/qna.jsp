<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>문의하기</title>

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

<div style="width: 500px; margin: 30px auto 30px auto;">
	<div class="mb-3 row">
	    <label for="userId" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" readonly class="form-control-plaintext" id="userId" value="${userid}">
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


<%@ include file="../ui/footer.jsp" %>



<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

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
				location.href='myqna';
			},
			error: function(error) {
				console.log(error);
			}
		})
	}
</script>
  </body>
</html>