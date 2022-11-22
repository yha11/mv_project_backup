<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비피아 | FAQ</title>
</head>
<body>
<div style="width: 1000px; margin: 30px auto 30px auto;">
	<h1 style="text-align: center">FAQ</h1>
	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingOne">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	        Q. 아이디가 기억나지 않습니다.
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	<p>아이디를 분실하셨을 경우에는 홈페이지 아이디 찾기에서</p>
			<p>이름, 전화번호를 이용하여 확인하실 수 있습니다.</p>
			<br>
			<p>로그인창 하단에 있는 아이디 찾기 메뉴를 이용해주세요.</p>
			<a href="/views/login/findId">아이디 찾기 바로가기</a>
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	        Q. 비밀번호가 기억나지 않습니다.
	      </button>
	    </h2>
	    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	<p>비밀번호를 분실하셨을 경우에는 홈페이지 비밀번호 찾기에서</p>
			<p>이름, 아이디, 전화번호를 이용하여 확인하실 수 있습니다.</p>
			<br>
			<p>로그인창 하단에 있는 비밀번호 찾기 메뉴를 이용해주세요.</p>
			<a href="/views/login/findPassword">비밀번호 찾기 바로가기</a>
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	        Q. 개인정보는 어떻게 변경하나요?
	      </button>
	    </h2>
	    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	<p>개인정보를 변경하고 싶을 때는 홈페이지 로그인 후 정보관리 페이지에서 진행하실 수 있습니다.</p>
	      	<br>
	      	<p>홈페이지에서 개인정보를 변경하고자 하는 아이디로 로그인합니다.</p>
	      	<p>[마이페이지] - [정보관리]를 클릭합니다.</p>
	      	<p>변경하실 개인정보를 입력하신 뒤, [수정]을 클릭합니다.</p>
	      	<a href="/views/my/infomodify">정보관리 바로가기</a>
	      </div>
	    </div>
	  </div>
	</div>
</div>

<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>