<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 메인 페이지  navigation bar 부분 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- Bootstrap core JS-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<%
	String name = (String)session.getAttribute("name");
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
                        <li><a class="nav-link" href="about">사이트 소개</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="javascript:method2();">공지사항</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">문의하기</a></li>
                                <li><a class="dropdown-item" href="#!">자주묻는 질문</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="/movie">영화 둘러보기</a></li>
                    </ul>

                    &nbsp;&nbsp;&nbsp;
                    <%if(name != null){ %>
	                <form action ="orderOkList.do?pageSize=10&pageNum=1" class="d-flex">
	                	<input type="hidden" name="pageSize" value="10">
	                	<input type="hidden" name="pageNum" value="1">
	                    <button class="btn btn-outline-dark" type="submit">
	                            	마이페이지
	                    </button>
	                </form>
	                <br>
                    <form action ="logout" class="d-flex">
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
                    <form action ="/views/user/login" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            	로그인/회원가입</button>
                    </form>
                    <%} %>
                    
                </div>
        </nav>
</body>
</html>