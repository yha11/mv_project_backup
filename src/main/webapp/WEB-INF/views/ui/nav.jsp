<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- 메인 페이지  navigation bar 부분 -->
<head>
<!-- 다른 페이지에 부트스트랩이 안먹혀서 일단 주석처리 해놨습니다. -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li {
	margin: 20px 0px;
	padding-right: 0px;
	font-size: 14px;
	float: left;
}
</style>
</head>
<body>
<!-- 다른 페이지에 부트스트랩이 안먹혀서 일단 주석처리 해놨습니다. -->
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<%
	String name = (String)session.getAttribute("userName");
	int admin;
	if (name == null)
		admin = -1;
	else
	{
		admin = (Integer)session.getAttribute("admin");
	}
%>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="/">영화 리뷰사이트</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li><a class="nav-link" href="/views/ui/about">사이트 소개</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/views/board/board-list">공지사항</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/views/my/qna">문의하기</a></li>
                                <li><a class="dropdown-item" href="#!">자주묻는 질문</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="/movie">영화 둘러보기</a></li>
                    </ul>

                    &nbsp;&nbsp;&nbsp;
                    <%if(name != null){ %>
                    <h3>${userName}</h3>님 안녕하세요!영화리뷰 사이트입니다.
	                <form action ="/views/my/mypage" class="d-flex">
	                	<input type="hidden" name="pageSize" value="10">
	                	<input type="hidden" name="pageNum" value="1">
	                    <button class="btn btn-outline-dark" type="submit">
	                            	마이페이지
	                    </button>
	                </form>
	                <br>
                    <form action ="/views/login/logout" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            		로그아웃
                        </button>
                    </form>    

	                    <%if(admin == 1){ %>
	                    <form action ="memberSearch.do" method="post" class="d-flex">
	                        <button class="btn btn-outline-dark" type="submit">
	                            	관리자페이지
	                        </button>
	                    </form>
	                    
	                    <%} %>      
	                
                    <%} else { %>
                    <form action ="/views/login/login" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            	로그인/회원가입</button>
                    </form>
                    <%} %>
                    
                </div>
        </nav>
<!-- 다른 페이지에 부트스트랩이 안먹혀서 일단 주석처리 해놨습니다. -->
<!--         <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script> -->
</body>
</html>