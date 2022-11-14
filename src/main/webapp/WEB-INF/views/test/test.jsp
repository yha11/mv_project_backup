<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
</head>
<body>

<div id="boxoffice">
    박스 오피스 순위<br>
</div>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
//조회할 날짜를 계산
	var dt = new Date();
	
	var m = dt.getMonth() + 1;
	if (m < 10) {
		var month = "0" + m;
	} else {
		var month = m + "";
	}
	
	var d = dt.getDate() - 1;
	if (d < 10) {
		var day = "0" + d;
	} else {
		var day = d + "";
	}
	
	var y = dt.getFullYear();
	var year = y + "";
	
	var result = year + month + day;
	
	$(document).ready(function(){
		mvlist();
	})
	
	function mvlist() {
		let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=ca61f1098ebd54d4fab68a53decd5572&targetDt="+result;
		
		$.getJSON(url, function(data) {
			let movieList = data.boxOfficeResult.dailyBoxOfficeList;
			$("div").empty(); // 두 번 클릭했을 때 기존 내용을 지워줌
            $("div").append(result+" 박스 오피스 순위<br>");
            for(let i in movieList){
                $("div").append("<span id= '"+movieList[i].movieCd + "'>" +(parseInt(i)+1) + " " + movieList[i].movieNm+"/"+movieList[i].audiAcc + "명 " + "</span><hr>" );
            }
		}) 
	}
</script>

</body>
</html>