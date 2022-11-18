<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<style>
	.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 30px;
    height: 30px;
    background-image: url('../../resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 30px 30px;
    cursor: pointer;
    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: #ffc400;
	}
	.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
	}
</style>
</head>
<body>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<div style="width: 500px; margin: 30px auto 30px auto;">
	<div class="mb-3 row">
	    <label for="userId" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" readonly class="form-control-plaintext" id="userId" value="${userId}">
	    </div>
  	</div>
	<div class="mb-3 row">
	    <label for="mvTitle" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; text-align: center;">영화</label>
	    <div class="col-sm-10">
	    <input type="text" readonly class="form-control-plaintext" id="mvTitle" value="">
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="mvRate" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">별점</label>
	    <div class="col-sm-10">
	    	<div class="rating">
		        <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
		        <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
		        <label for="rating1"></label>
		        <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
		        <label for="rating2"></label>
		        <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
		        <label for="rating3"></label>
		        <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
		        <label for="rating4"></label>
		        <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
       		 	<label for="rating5"></label>
        	</div>
	    </div>
  	</div>
  	<div class="mb-3 row">
	    <label for="mvReview" class="col-sm-2 col-form-label" style="background-color: #dddddd; border-radius: 6px; display: flex; flex-direction: column; justify-content: center; align-items: center;">관람평</label>
	    <div class="col-sm-10">
	    <textarea class="form-control" id="reviewContent" rows="3" style="height: 200px"></textarea>
	    </div>
  	</div>
	<div style="width: 200px; margin: 30px auto 30px auto; display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<button type="button" class="btn btn-primary" style="border-radius: 20px;" onclick="writeReview()">등록하기</button>
	</div>
</div>
<script>
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	let rating = new Rating();//별점 인스턴스 생성
	
	document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	        }
	    })
	});
	
	$(document).ready(function() {
		getMvTitle();
	})
	
	function getMvTitle() {
		$.ajax({
			url : '/movie/${param.movieNum}',
			type : 'GET',
			accept : "application/json",
	    	contentType: "application/json; charset=utf-8",
	    	dataType : "json",
	    	success : function(res) {
	    		console.log(res);
	    		var title = res.title;
	    		
	    		$("#mvTitle").attr("value", title);
	    	}
			
		})
	}
	
	function writeReview() {
		var star = 0;
		$('input[name=rating]:checked').each(function() {
			star = $(this).val();
		})
		console.log(star);
		
		var data = {
				movieNum : ${param.movieNum},
				reviewContent : $('#reviewContent').val(),
				reviewStarrate : star,
		}
		console.log(data);
		
 		$.ajax({
			url : '/addreview',
			type : 'POST',
			accept : "application/json",
	    	contentType: "application/json; charset=utf-8",
	    	data: JSON.stringify(data),
			dataType: "json",
			success : function(res) {
				console.log(res);
				location.href='mvinfo-reviews?movieNum=' + ${param.movieNum};
				
			},
			error: function(error) {
				console.log(error);
			}
			
		}) 
	}
</script>
<%@ include file="/WEB-INF/views/ui/foot.jsp"%>
</body>
</html>