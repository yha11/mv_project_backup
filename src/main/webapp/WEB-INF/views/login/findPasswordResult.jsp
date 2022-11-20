<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화리뷰사이트 | 비밀번호찾기</title>
	<script type="text/javascript" >
		var message = "<c:out value='${message}'/>";
		alert(message);
		//존재하지 않는 회원일 경우
		if (message == "입력하신 정보와 일치하는 회원정보가 없습니다.") {
			window.location.href = "/views/login/findPassword";
		}
	</script>
	
	<style type="text/css">
		table{
			margin:auto;
	
		}
		.title{
			margin: auto;
			text-align: center;
			font-size: 6px;
			font-color: gray;
		}
		
		section {
			width:1000px;
			margin-left:auto; 
	        margin-right:auto;
	        margin-bottom: 10px;
		}
	</style>
<script type="text/javascript" src="/resources/js/jquery3.6.1.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
</head>
<body>
	<div id="Wrap">
			<section>
				<div align="center"><b><font size="6" color="gray">비밀 번호 변경</font></b></div>
				<hr>
				<form action="/updatePassword.do" method="post" name="frm" onsubmit='return updatePassword()'>
					<table>
						<tr>
							<td>새 비밀번호 <i class="bi bi-check-lg" style="color: red;"></i></td>
							<td><input type="password" id="password" name="password" size="20" maxlength="16"></td>
							<td><input type="hidden" name="passwordValid" size="20" value="false"></td>
						</tr>
						<tr>
							<td/>
							<td>
								<p class="txt_guidePassword" >
									<span class="badPasswordGuide1">비밀 번호는 8글자 이상이어야 합니다</span> <br>
									<span class="badPasswordGuide2">비밀 번호는 영문, 숫자, 특수문자 중 2가지 이상을 조합해야합니다</span>
								</p>
							</td>
						</tr>
						<tr>
							<td>비밀번호 확인 <i class="bi bi-check-lg" style="color: red;"></i></td>
							<td><input type="password" id="pwd_check" name="pwd_check" size="20" maxlength="16"></td>
						</tr>
						<tr>
							<td/>
							<td>
								<p class="txt_guidePasswordCheck" >
									<span class="badPasswordCheckGuide"></span>
									<input type="hidden" name="passwordCheckValid" value="false" size="20">
								</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="비밀번호 변경">
								<input type="hidden" name="userId" value="${param.userId }">
							</td>
						</tr>
					</table>					
				</form>
			</section>
	</div>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>