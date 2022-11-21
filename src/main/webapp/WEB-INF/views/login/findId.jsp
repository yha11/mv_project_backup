<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화리뷰사이트 | 아이디찾기</title>
<script type="text/javascript" src="/resources/js/jquery3.6.1.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
</head>
<body>
	<div id="Wrap">
			<section>
			<br><br><br><br><br>
			<div style="width: 30%; margin-left: auto; margin-right: auto;" align="center">
			<h2>아이디 찾기</h2>
			<br>
			<hr>
			<br>
				<form action="/findId.do" method="post" name="frm" onsubmit='return findId()'>
					<table>
						<tr>
							<td>
								이름
							</td>
							<td>
								<input type="text" name="userName" size="5" id='name'>
							</td>
						</tr>
						<tr>
							<td>　</td>
						</tr>
						<tr>
							<td>
								휴대폰번호 </td>
								<td> <input type='tel' class="phone" name='phone' maxlength="13" size="13"/>
							</td>
						</tr>
					</table>
					<br><br><br>
					
					<button class="back-btn" onclick="history.back()" style="float:center">이전</button>
					<input type="submit" value="확인" class="back-btn" style="float:center">
				</form>
				</div>
			</section>
		<jsp:include page="/WEB-INF/views/ui/footer.jsp"></jsp:include>
	</div>
	
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>