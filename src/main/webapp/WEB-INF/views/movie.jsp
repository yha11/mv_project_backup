<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta name="viewport" content="initial-scale=1, maximum-scale=1" />
<link
	href="resources/style.css"	rel="stylesheet" />
</head>
<body>
		<h1>Movie chart</h1>
	<div id="container"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="AA">
				<div class="BB"><input type="checkbox"></div>
				<div class="rank">{{rank}}</div>
				<a class="link" href="http://www.cgv.co.kr{{link}}" target="_blank"><img class="image" src="{{image}}"></a>
				<div class="p">
					<div class="title">{{title}}</div>
					<div>예매율 <span class="percent">{{percent}}</span></div>
					<div class="ticketing"><a href="http://www.cgv.co.kr{{ticketing}}" target="_blank"></a></div>
				</div>
			</div>
		{{/each}}
	</script>

	<div class="right_box">
		<h2>영화검색</h2>
		검색어: <input type="text" id="keyword" value=""> <input
			type="button" value="검색" id="btnsearch">
		<table id="tbl" border=1 width=350></table>
		<script id="temp2" type="text/x-handlebars-template">
		<tr>
			<td width=100>제목</td>
			<td>주연</td>
			<td width=40>평점</td>
		</tr>
	{{#each items}}
		<tr>
			<td>{{{title}}}</td>
			<td>{{{actor}}}</td>
			<td>{{{userRating}}}</td>
		</tr>
	{{/each}}
	</script>
		<div class="ri_btn">
			<button id="btnprev">이전</button>
			<button id="btnnext">다음</button>
		</div>
	</div>

</body>
<script>

	// cgv 
	getlist();
	function getlist() {
		$.ajax({
			type : "get",
			url : "movie.json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#container").html(temp(data));
			}
		});
	}


	//검색

	var keyword = $("#keyword").val();
	var start = 1;
	getSearch();

	$("#btnnext").on("click", function() {
		start = start + 5;
		getSearch();
	});

	$("#btnprev").on("click", function() {
		if (start > 1) {
			start = start - 5;
			getSearch();
		}
	});

	$("#btnsearch").on("click", function() {
		$("#tbl").html("");
		keyword = $("#keyword").val();
		getSearch();
	});
	$("#keyword").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#tbl").html("");
			keyword = $("#keyword").val();
			getSearch();
		}
	})
	function getSearch() {
		$.ajax({
			type : "get",
			url : "nmovie.json",
			dataType : "json",
			data : {
				"keyword" : keyword,
				"start" : start
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp2").html());
				$("#tbl").html(temp(data));
			}
		});
	}
</script>
</html>