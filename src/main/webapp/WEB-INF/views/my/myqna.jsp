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
	  <div style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<a href="#" class="btn btn-primary" style="border-radius: 20px;" onclick="location.href='qna'">문의하기</a>
	  </div>
</div>



<%@ include file="../ui/footer.jsp" %>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">

$(document).ready(function(){
	getBoards();
})

function getBoards(){
	const data = {
			page : 1,
			pageSize : 10
	}
	$.ajax({
		type:'GET',
		url:'/qnaboard',
		data : data,
		accept: "application/json",
		success:function(res){

			$('#totalDiv').html('총갯수:' + res.total);
			let html = '';
			let list = res.list;
			for(let i=0;i<list.length;i++){
				const board = list[i];
				console.log(board);
				html += '<tr style="cursor:pointer" onclick="goBoardView(' + board.boardNum + ')">';
				html += '<th scope="row">' + board.boardNum + '</th>';
				for(let le=1;le<board.level;le++){
					board.boardTitle = '&nbsp; ㄴ &nbsp;' + board.boardTitle;
				}
				html += '<td>' + board.boardTitle + '</td>';
				html += '<td>' + board.crename + '</td>';
				html += '<td>' + board.credate + '</td>';
				html += '</tr>';
			}
			console.log(html);
			$('tBody').html(html);
		}
	})
}

function goBoardView(boardNum){
	location.href='/views/board/board-view?boardNum=' + boardNum;
}

</script>
  </body>
</html>