<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비피아 | 문의하기</title>
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<div style="width: 500px; margin: 30px auto 30px auto;">
	<div class="mb-3 row">
	    <label for="qnaDate" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">문의 날짜</label>
	    <div class="col-sm-10">
	      <input type="text" readonly class="form-control-plaintext" id="qnaDate" name="qnaDate" value="">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="qnaStatus" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">처리 현황</label>
	    <div class="col-sm-10">
	      <input type="text" readonly class="form-control-plaintext" id="qnaStatus" name="qnaStatus" value="">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="qnaTitle" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">제목</label>
	    <div class="col-sm-10">
	    <input type="text" readonly class="form-control-plaintext" id="qnaTitle" name="qnaTitle" value="">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="qnaContent" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">문의 내용</label>
	    <div class="col-sm-10">
	    <textarea readonly class="form-control-plaintext" id="qnaContent" name="qnaContent" rows="3" style="height: 100px; resize: none;"></textarea>
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="qnaAnswer" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">답변 내용</label>
	    <div class="col-sm-10">
	    <textarea readonly class="form-control-plaintext" id="qnaAnswer" name="qnaAnswer" rows="3" style="height: 100px; resize: none;"></textarea>
	    </div>
		<div id="answerbutton">
		<!-- 관리자용 답변 버튼 -->
		</div>
		<div style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<button type="button" class="btn btn-primary" name="myqna" style="border-radius: 6px;" onclick="goQnaList()">목록</button>
		</div>
  	</div>
</div>

<script>
	$(document).ready(function() {
		qnaview();
	})

	var role = ${admin};
	
	if(role === 1) {
		adminqnaview();
	}
	
	function qnaview() {
		$.ajax({
			url : '/qnadetail/${param.qnaNum}/${param.userNum}',
			type : 'GET',
			accept : "application/json",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success : function(res) {
				console.log(res);
				var qnaDate = res.qnaDate;
				var qnaStatus = res.qnaStatus;
				var qnaTitle = res.qnaTitle;
				var qnaContent = res.qnaContent;
				var qnaAnswer = res.qnaAnswer;
				
				$('input[name=qnaDate]').attr('value',qnaDate);
				$('input[name=qnaStatus]').attr('value',qnaStatus);
				$('input[name=qnaTitle]').attr('value',qnaTitle);
				$('textarea[name=qnaContent]').html(qnaContent);
				$('textarea[name=qnaAnswer]').html(qnaAnswer);
				
			},
			error: function(error) {
				console.log(error);
			}
		})
		
	}
	
	function adminqnaview() {
		$('#qnaAnswer').attr('readonly', false);
		
		let html = '';
		html += '<div style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">';
		html += '<button type="button" class="btn btn-primary" style="border-radius: 6px;" onclick="answer()">답변 등록</button>';
		html += '</div>';
		
		$('#answerbutton').html(html);
		
		$('button[name=myqna]').attr('onclick', 'goAllQnaList()');
		
	}
	
	function answer() {
		var data = {
				qnaNum : ${param.qnaNum},
				qnaAnswer : $('#qnaAnswer').val()
		}
		console.log(data);
		
		$.ajax({
			url : '/modifyqna',
			type : 'POST',
			accept : "application/json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json",
			success : function(res) {
				console.log(res);
				alert('답변이 등록되었습니다.');
				location.href='/views/admin/allqna';
				
			},
			error: function(error) {
				console.log(error);
			}
		})
	}
	
	function goQnaList() {
		window.history.back(); //뒤로가기
	}
	
	function goAllQnaList() {
		window.history.back(); //뒤로가기
	}
</script>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>