<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/common/import.jsp"></c:import>
	<style>
	.gradient-custom {
		/* fallback for old browsers */
		background: #6a11cb;
		/* Chrome 10-25, Safari 5.1-6 */
		background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1),
			rgba(37, 117, 252, 1));
		/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		background: linear-gradient(to right, rgba(106, 17, 203, 1),
			rgba(37, 117, 252, 1))
	}
	</style>
</head>
<body>
<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <div class="form-outline form-white mb-4">
              <h2 class="fw-bold mb-2 text-uppercase">로그인</h2>
              </div>

              <div class="form-outline form-white mb-4">
                <input type="text" id="userId" class="form-control form-control-lg" placeholder="아이디를 입력해주세요" />
                <label class="form-label" for="typeEmailX">ID</label>
              </div>

              <div class="form-outline form-white mb-4">
                <input type="password" id="password" class="form-control form-control-lg" placeholder="비밀번호를 입력해주세요"/>
                <label class="form-label" for="typePasswordX">Password</label>
              </div>

              <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">비밀번호를 잊으셨나요?</a></p>

              <button class="btn btn-outline-light btn-lg px-5" type="button" onclick="login()">로그인</button>

              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

            <div>
              <p class="mb-0">회원이 아니신가요? <a href="#!" class="text-white-50 fw-bold">회원가입</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script>
	function login(){
		//유효성 검사
		//아이디를 공백제거후 3글자 미만일때
		if($('#userId').val().trim().length<3){
			alert('아이디 확인!!')
			//아이디값 초기화
			$('#userId').val('');
			//포커스 이동
			$('#userId').focus();
			//function 나감
			return;
		}
		//비밀번호를 공백제거후 3글자 미만일때
		if($('#password').val().trim().length<3){
			alert('아이디 확인!!')
			//아이디값 초기화
			$('#password').val('');
			//포커스 이동
			$('#password').focus();
			//function 나감
			return;
		}
		
		//위의 유효성검사를 모두 통과했을때
		const param = {
				userId : $('#userId').val(),
				password : $('#password').val()
		}
		$.ajax({
			url : '/auth/login',
			type: 'POST',
			accept: "application/json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(param),
			dataType: "json",
			success: function(data) {
				if(data.success === 'ok'){
					alert(data.userName + '님 로그인에 성공하였습니다.');
					location.href='/'
				}
			},
			error: function(error) {
				console.log(error);
			}
		})
	}
</script>
</body>
</html>