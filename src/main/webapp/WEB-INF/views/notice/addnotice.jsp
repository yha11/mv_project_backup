<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<!-- 공지 게시물 쓰기 -->
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화리뷰사이트 | 공지게시물 쓰기</title>
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<div style="width: 500px; margin: 30px auto 30px auto;">
	<div class="mb-3 row">
	    <label for="noticeWriter" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">작성자</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control-plaintext" id="noticeWriter" value="${userName}">
	    </div>
  	</div>
	<div class="mb-3 row">
	    <label for="noticeTitle" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">제목</label>
	    <div class="col-sm-10">
	    <input type="text" class="form-control" id="noticeTitle">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="noticeContent" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">내용</label>
	    <div class="col-sm-10">
	    <textarea class="form-control" id="noticeContent" rows="3" style="height: 200px"></textarea>
	    </div>
  	</div>
	<div style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<button type="button" class="btn btn-primary" style="border-radius: 20px;" onclick="location.href='/views/notice/noticelist'">목록</button>
		<button type="button" class="btn btn-primary" style="border-radius: 20px;" onclick="addNotice()">작성하기</button>
	</div>
</div>
	<script>

		function addNotice() {
			if($('#noticeTitle').val().trim().length<1){
				alert('제목을 입력해주세요.');
				$('#noticeTitle').focus();
				return;
			}
			if($('#noticeContent').val().trim().length<1) {
				alert('내용을 입력해주세요.');
				$('#noticeContent').focus();
				return;
			}
			
			var data = {};
			$('[id]').each(function(idx, item) {
				data[item.id] = item.value;
			})
			
			$.ajax({
				type : 'POST',
				url : '/addNotice',
				accept : "application/json",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(data),
				dataType: "json",
				success : function(res) {
					console.log(res);
					alert('공지가 등록되었습니다.');
					location.href='noticelist';
				},
				error: function(error) {
					console.log(error);
				}
			})
		}

		function goNoticeView(noticeNum) {
			location.href = '/views/notice/noticelist'
		}
	</script>	
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>