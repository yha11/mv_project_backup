<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<!-- 공지 게시물 읽기 -->
<html>
<head>
<meta charset="UTF-8">
<title>무비피아 | 공지사항</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<div style="width: 500px; margin: 30px auto 30px auto;">
	<div class="mb-3 row">
	    <label for="noticeDate" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">작성 날짜</label>
	    <div class="col-sm-10">
	      <input type="text" readonly class="form-control-plaintext" id="noticeDate" name="noticeDate" value="">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="noticeTitle" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">공지제목</label>
	    <div class="col-sm-10">
	    <input type="text" readonly class="form-control-plaintext" id="noticeTitle" name="noticeTitle" value="">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="noticeContent" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">공지 내용</label>
	    <div class="col-sm-10">
	    <textarea readonly class="form-control-plaintext" id="noticeContent" name="noticeContent" rows="3" style="height: 100px; resize: none;"></textarea>
	    </div>
  	</div>
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
					console.log(res);
					var noticeDate = res.noticeDate;
					var noticeTitle = res.noticeTitle;
					var noticeContent = res.noticeContent;
					
					$('input[name=noticeDate]').attr('value',noticeDate);
					$('input[name=noticeTitle]').attr('value',noticeTitle);
					$('textarea[name=noticeContent]').html(noticeContent);
					
				},
				error: function(error) {
					console.log(error);
				}
			})
			
		}

	</script>	
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>