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

	<div id="review">
		<span>review</span>
		<div class="inreview"></div>
		<script id="temp1" type="text/x-handlebars-template">
			{{#each .}}
				<div><span class="una">{{username}}</span>
				<span class="uco">{{content}}</span></div>
			{{/each}}
		</script>
		<div class="inreview2">
			<input type="hidden" id="mrank"> <input type="text"
				id="username" class="txtreview" maxlength="3"> <input
				type="password" id="userpw" class="txtreview"> <input
				type="text" id="content" class="txtreview">
			<button class="btnreview" onClick="funInsert()">등록</button>
		</div>
	</div>

	<div class="right_btn" style="margin-top: 0;">
		<table id="reservation"></table>
		<script id="temp-r" type="text/x-handlebars-template">
		{{#each .}}
			<tr class="reserA">
				<td class="title title2" rank="{{rank}}">{{title}}</td>
				<td>
					<button onClick="window.open('{{link}}')" target="_blank">영화정보</button>
				</td>
				<td>
					<button onClick="window.open('{{ticketing}}')" target="_blank">예매하기</button>
				</td>
				<td><button class="reserdel">삭제</button></td>
			</tr>
		{{/each}}
		</script>
	</div>
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
	var mrank;

	// 덧글 입력
	function funInsert() {
		var username = $("#username").val();
		var userpw = $("#userpw").val();
		var content = $("#content").val();
		mrank = $("#mrank").val();

		$.ajax({
			type : "post",
			url : "minsert",
			data : {
				"username" : username,
				"userpw" : userpw,
				"content" : content,
				"mrank" : mrank
			},
			success : function(data) {
				getReply();
				username = $("#username").val("");
				userpw = $("#userpw").val("");
				content = $("#content").val("");
			}
		});
	}

	// 리뷰 보기
	$("#reservation").on("click", ".reserA .title", function() {
		$("#review").show();
		mrank = $(this).attr("rank");
		getReply();
	});

	function getReply() {
		$.ajax({
			type : "get",
			url : "list.json",
			data : {
				"mrank" : mrank
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp1").html());
				$(".inreview").html(temp(data));
				$("#mrank").val(mrank);
			}
		});
	}

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

	// 예약 보기
	getrlist();
	function getrlist() {
		$.ajax({
			type : "get",
			url : "list",
			success : function(data) {
				var temp = Handlebars.compile($("#temp-r").html());
				$("#reservation").html(temp(data));
			}
		});
	}

	$("#insert").on("click", function() {
		if (!confirm("저장하시겠습니까?"))
			return;
		
		$("#container .AA input:checkbox:checked").each(function() {
			var row = $(this).parent().parent();

			var rank = row.find(".rank").html();
			var image = row.find("img").attr("src");
			var title = row.find(".title").html();
			var percent = row.find(".percent").html();
			var link = row.find(".link").attr("href");
			var ticketing = row.find(".ticketing a").attr("href");
		
			$.ajax({
				type : "get",
				url : "insert",
				data : {
					"rank" : rank,
					"image" : image,
					"title" : title,
					"percent" : percent,
					"link" : link,
					"ticketing" : ticketing
				},
				success : function() {
				}
			});

			$(this).prop("checked", false);
		});

		alert("저장되었습니다");
		getrlist();
		/* getlist(); */

	});

	// 삭제
	$("#reservation").on("click", ".reserA .reserdel", function() {
		var reserA = $(this).parent().parent();
		rank = reserA.find(".title").attr("rank");

		$.ajax({
			type : "post",
			url : "mdelete",
			data : {
				"mrank" : rank
			}
		})

		$.ajax({
			type : "post",
			url : "delete",
			data : {
				"rank" : rank
			},
			success : function() {
				alert("삭제되었습니다.");
				getrlist();
			}
		})
	});

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