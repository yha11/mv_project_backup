<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/import.jsp"></c:import>
</head>
<body>
	<input type="text" id="id" >
	<button onclick="test()">로그인</button>
	<script>
		function test(){
			//var idStr = document.querySelector('#id').value;
			if($('#id').val().trim().length<3){
				alert('아이디를 확인해주세요!!');
				return;
			}
		}
		/*
		html 태그의 속성앞에 "on"이 붙어? 아 몰라 그럼 무조건 이벤트!!!! 
		*/
	</script>
</body>
</html>