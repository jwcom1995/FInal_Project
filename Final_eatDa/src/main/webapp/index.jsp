<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=IBM+Plex+Sans+KR:wght@200&display=swap" rel="stylesheet">

<style>
.banner {
	background-image: url(resources/images/recipe/main-banner2.png);
	background-size: cover;
	width: 100%;
	margin: 0 auto;
	height: 280px;
	margin-bottom: 30px;
	padding-top: 180px;
	border-radius: 4px;
	/*123*/
}

.page-navi {
	width: 100%;
	height: 20%;
	margin: 0 auto;
	margin-top: 1%;
	margin-bottom: 1%
}

.page-navi div span {
	color: rgb(148, 148, 32);
	font-size: larger;
}

.new-title {
	text-align: center;
}

.title-font {
	display: inline-block;
	font-family: "Noto Serif KR", serif, Helvetica, "Helvetica Neue", Arial;
	font-style: normal;
	font-weight: 800;
	font-size: 32px;
	letter-spacing: 1px;
	text-align: center;
	color: rgb(147, 112, 98);
	margin-top: 3%;
	border-bottom: 1px solid;
	margin-bottom: 40px;
}

.col-md-3 img {
	width: 100%;
	height: 200px;
}

.text-font {
	margin: 16px 0px 8px;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 10px;
	letter-spacing: 1px;
	color: rgb(97, 97, 97);
	text-align: right;
}

.font-noto-sans {
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}

.sub-title:hover {
	color: rgb(147, 112, 98);
	cursor: pointer;
}

.sub-title {
	font-size: small;
}

.block {
	width: 100%;
	margin: 0px 0px 8% 0px;
	line-height: normal;
	box-shadow: 0px 4px 4px -4px gray;
	padding-bottom: 70px;
}

<!--
왜 안들어 가는거쥐-->.block:nth-of-type(2n) {
	background-color: #ffe38f;
}

.thumbnail {
	width: 100%;
	height: 100%;
	border-radius:15px 5px 5px 15px;
}

.heart {
	width: 20px;
	height: 20px;
}

.item-inner {
	display: flex;
	width: 100%;
	height:100%;
	/*border:1px solid gray;*/
	box-shadow:1px 1px 10px 1px rgb(143, 135, 135);
	border-radius:15px;
}

.item-title, .item-heart {
	margin: 1% 5% 0% 5%;
}
.item-heart {
	width: 5%;
	text-align:center;
}

.recommend-menu .list-base {
	margin-left: 15%;
}
.list-base {
	width:90%;
}

.recommend-menu {
	margin-bottom: 0px;
	box-shadow: 0;
}

/* 동희 css */
li {
	list-style: none;
}

.a-tag {
	color: black;
	text-decoration: none;
}

.list-item {
	width: 100%;
	height:110px;
	margin-bottom: 10px;
}

/* product css */
.product-btn {
	width: 40px;
	height: 40px;
	margin-top: 150px;
}

.p-card {
	width: 20%;
	height: 500px;
	float: left;
	margin: 0 1%;
	box-shadow:1px 1px 20px 1px rgb(143, 135, 135);
}
.product-btn:hover {
	cursor:pointer;
}

.subSection-img {
	background-image: url(resources/images/sub-envelope.jpeg);
	background-size: cover;
	background-repeat: none;
}

/* recent-Recipe */
.recent-cart {
	height: 380px; 
}
.recent-title {
	margin: 1% 0 10px 0; font-size: 17px;
}
.recent-text {
	letter-spacing: 0.5px; font-size: 15px; margin-bottom: 90%;
}
.recipe-no {
	display:none;
}
.card-img-top:hover, .card-title:hover, .recipe-text:hover, .product-text:hover, .heart:hover, .a-tag:hover, .thumbnail:hover, .subSection-img:hover, 
.item-inner:hover
{
	cursor:pointer;
}
.card-img-top {
	width:100%;
	height:100%;
}
.card-img-div {
	width:100%;
	height:55%;
	margin: 15px 0;
}
.popular-text {
	margin-right: 10%;
	margin-bottom:0px;
	font-size:15px;
	letter-spacing:1px;
}
.pop-title {
	padding-left:3%;width:100%; height:20%; font-size:large; color:gray;margin-top:10px;
}
.pop-content {
	margin-top:5px;width:100%; height:80%; padding:5px; letter-spacing:1px;
}

.item-img {
	width:25%;
	height:100%;
}
.item-title {
	width:75%;
}
.p_title {
	font-size:larger;
	font-weight:400;
} 
 
</style>

<title>행복을 함께 나누다 EatDa</title>

<script type="text/javascript">
	$(document).ready(function() {
		let list = getMarketProduct();
		let index = 2;
		
		getRecentRecipe();
		makeProductSection(list);
		getPopularBlog();
		getLovingRecipe();
		
		window.setInterval(function() {
			$('.list-item').eq(0).animate({opacity:0},800);
			$('.list-item').eq(1).animate({opacity:0},1200);
			$('.list-item').eq(2).animate({opacity:0},1600);
			window.setTimeout(function(){
				getLovingRecipe();
			},1800)
		},9000);
		
		//배너 사진 변경
		window.setInterval(function() {
			if (index == 4) {
				index = 1;
			}
			$('.banner').animate({opacity : 0},800,function() {
								$('.banner').css('background-image','url(resources/images/recipe/main-banner'+ index + '.png)');
							});
			$('.banner').animate({opacity : 1}, 800);
				index++;
		}, 12000);
		
		//좌 우 버튼 클릭
		$('.product-btn:eq(0)').click(function() {
			productSwitchBtn(list, 'left');
		});
		$('.product-btn:eq(1)').click(function() {
			productSwitchBtn(list, 'right');
		});
	});
	
	const getMarketProduct = () => {
		var list;
		$.ajax({
			url:"getMarketData.do",
			type:"post",
			async: false,
			dataType:"json",
			success:function(data) {
				list = data;
			}
		});
		return list;
	}
	
	const makeProductSection = (list) => {
		let temp = new Array();
		for (var i = 0; i < 4; i++) {
			temp.push(list[i]);
		}
		
		$(temp).each(function(key, value) {
			$('.product-section').append(
				"<div class='card p-card'>" +
				"<span class='p-id' style='display:none;'>" + value.p_id + "</span>" +
				"<span class='p-key' style='display:none;'>" + key + "</span>" +
				"<div class='card-img-div'>" +
				"<img onclick='goProductPage(this)' class='card-img-top' src=" + value.img_path + ">" +
				"</div>" +
				"<div class='card-body'>" +
				"<h6 class='card-subtitle mb-2 text-muted'>" + value.p_short_desc + "</h6>" +
				"<h5 onclick='goProductPage(this)' class='card-title p_title'>" + value.p_name + "</h5>" + 
				"<p class='card-text'>" +
				"<span>" + value.p_price + "</span><span>원</span>" +
				"</p>" +
				"<p class='card-text'>" + value.p_description + "</p>" +
				"</div>" +
				"</div>"
			);
		});
	}
	
	const productSwitchBtn = (list, direction) => {
		let getKey;
		let product;
		
		if (direction == 'left') {
			let key = Number($('.p-card:eq(0)').children('.p-key').text());
			if (key == 0) { return; }
			getKey = key - 1;
			product = list[getKey];
			
			$('.p-card:last').remove();
			$('.product-section').prepend(
					"<div class='card p-card'>" +
					"<span class='p-id' style='display:none;'>" + product.p_id + "</span>" +
					"<span class='p-key' style='display:none;'>" + getKey + "</span>" +
					"<div class='card-img-div'>" +
					"<img onclick='goProductPage(this)' class='card-img-top' src=" + product.img_path + ">" +
					"</div>" +
					"<div class='card-body'>" +
					"<h6 class='card-subtitle mb-2 text-muted'>" + product.p_short_desc + "</h6>" +
					"<h5 onclick='goProductPage(this)' class='card-title p_title'>" + product.p_name + "</h5>" + 
					"<p class='card-text'>" +
					"<span>" + product.p_price + "</span><span>원</span>" +
					"</p>" +
					"<p class='card-text'>" + product.p_description + "</p>" +
					"</div>" +
					"</div>"
			);
		} else if (direction == 'right') {
			let key = Number($('.p-card:last').children('.p-key').text());
			if (key == list.length-1) {
				return;
				alert('마지막 상품입니다.');
			}
			getKey = key + 1;
			product = list[getKey];
			
			$('.p-card:eq(0)').remove();
			$('.product-section').append(
					"<div class='card p-card'>" +
					"<span class='p-id' style='display:none;'>" + product.p_id + "</span>" +
					"<span class='p-key' style='display:none;'>" + getKey + "</span>" +
					"<div class='card-img-div'>" +
					"<img onclick='goProductPage(this)' class='card-img-top' src=" + product.img_path + ">" +
					"</div>" +
					"<div class='card-body'>" +
					"<h6 class='card-subtitle mb-2 text-muted'>" + product.p_short_desc + "</h6>" +
					"<h5 onclick='goProductPage(this)' class='card-title p_title'>" + product.p_name + "</h5>" + 
					"<p class='card-text'>" +
					"<span>" + product.p_price + "</span><span>원</span>" +
					"</p>" +
					"<p class='card-text'>" + product.p_description + "</p>" +
					"</div>" +
					"</div>"
			);
		}
	}
	
	const goProductPage = (object) => {
		let p_id = $(object).parent().siblings('.p-id').text();
		location.href='goProductPage.do?p_id=' + p_id;
	}
	
	const getRecentRecipe = () => {
		$.ajax({
			url:"getRecentRecipe.do",
			type:"post",
			dataType:"json",
			success:function(data) {
				console.log(data);
				$(data).each(function(key, value) {
					$('.rec-recipe').append(
						"<div class='col-md-3'>" +
						"<div class='card' style='height: 380px;'>" +
						"<div class='recipe-no'>" + value.recipe_no + "</div>" +
						"<div style='margin: 15px 0'>" +
						"<img onclick='goRecipeDetail(this)' class='card-img-top' src='" + value.recipe_img + "'>" +
						"</div>" +
						"<div class='card-body'>" +
						"<h5 onclick='goRecipeDetail(this)' class='card-title'>" + value.recipe_title + "</h5>" +
						"<p onclick='goRecipeDetail(this)' class='card-text recipe-text'>" + value.r_short_desc + "</p>" +
						"</div></div></div>"
					);
				});
			}
		});
	}
	
	const goRecipeDetail = (object) => {
		let recipe_no = 0;
		
		if ($(object).attr('class') == 'a-tag') {
			recipe_no = Number($(object).parents('.item-title').siblings('.recipe-no').text());
		} else {
			recipe_no = Number($(object).parent().siblings('.recipe-no').text());
		}
		
		location.href = 'recipeDetail.do?recipe_no=' + recipe_no;
	}
	
	const goBlogDetail = (object) => {
		const blog_no = Number($(object).children().eq(0).text());
		location.href='blog-detail.do?blog_no=' + blog_no;
	}
	
	
	//인기 eatdagram 가져오기 하트 구현되면 하트순으로 바꿔줘야함
	const getPopularBlog = () => {
		$.ajax({
			url:"getPopularBlog.do",
			type:"post",
			dataType:"json",
			success:function(data) {
				console.log(data);
				$(data).each(function(kay, value) {
					$('.list-base:eq(1)').append(
						"<li class='list-item'>" +
							"<div class='item-inner' onclick='goBlogDetail(this)'>" +
								"<div style='display:none;'>" + value.blog_no + "</div>"+
								"<div class='item-img'>" +
									"<img class='thumbnail' src=" + value.blog_img + ">" +
								"</div>" +
								"<div class='item-title'>" +
									"<div class='pop-title'>" +
										"<a class='a-tag' href='#'>" + value.blog_title + "</a>" +									
									"</div>" +
									"<div class='pop-content'>" +
										"<a class='a-tag' href='#'>" + value.blog_content + "</a>" +
									"</div>" +
								"</div>" +
							"</div>" +
						"</li>"
					);
				});
			}
		});
	}
	
	const getLovingRecipe = () => {
		$.ajax({
			url:"getLovingRecipe.do",
			type:"post",
			dataType:"json",
			success:function(data) {
				$('.list-base:eq(0)').html('');
				$(data).each(function(key, value) {
					$('.list-base:eq(0)').append(
							"<li class='list-item'>" +
								"<div class='item-inner'>" +
									"<div class='recipe-no'>" + value.recipe_no + "</div>" +
									"<div class='item-img'>" +
										"<img class='thumbnail' onclick='goRecipeDetail(this)' src=" + value.recipe_img + " style='margin-bottom:0; border-radius:15px 5px 5px 15px;'>" +
									"</div>" +
									"<div class='item-title'>" +
										"<div class='pop-title'>" +
											"<a class='a-tag' onclick='goRecipeDetail(this)'>" + value.recipe_title + "</a>" +									
										"</div>" +
										"<div class='pop-content'>" +
											"<a class='a-tag' onclick='goRecipeDetail(this)'>" + value.r_short_desc + "</a>" +
										"</div>" +
									"</div>" +
								"</div>" +
							"</li>"
					);
				});
			}
		});
	}
	
	
</script>

</head>
<body style="margin-top: 155px; min-width: 1400px;">
	<div id="header">
		<%@ include file="WEB-INF/views/common/header.jsp"%>
	</div>

	<div class="container" style="height: fit-content;">
		<!-- 배너 -->
		<div class="row" style="margin: 2% 0;">
			<div class="col-md-12 banner"></div>
		</div>
		<!-- 최신레시피 -->
		<!-- 롤로 옆으로 하나씩 카드를 가져올 수 있도록 구현 -->
		<div class="new-recipe block">
			<div class="row">
				<div class="col-md-12 new-title">
					<p class="title-font">NEW RECIPE</p>
				</div>
			</div>

			<div class="row rec-recipe">
				<div class="col-md-3">
					<div class="card recent-cart" style="border: 0; border-bottom: gray 1px dotted;">
						<div class="card-body" align="right">
							<h5 class="title-font recent-title">요즘 계절에 알맞은 레시피</h5>
							<p class="card-text recent-text">현재 계절에 알맞은 음식들의 레시피를 EatDa에서 준비해드렸어요.</p>
							<span onclick="location.href='recipeList.do'" class="font-noto-sans sub-title">레시피 보러가기></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 실시간 검색순위 -->
		<!-- 카운트 순위(조회수)를 바탕으로 반영 -->
		<div class="search-rank block" style="margin-bottom: 2%;">
			<div class="row" style="">
				<div class="col-md-6 new-title" style="text-align: right;">
					<p class="title-font" style="margin-right: 10%; margin-bottom: 10px;">지금 가장 사랑받는 레시피</p><br>
					<p class="font-noto-sans popular-text">지금 이 순간 여러분들에게 가장 사랑받는 레시피를 찾아봤어요</p>
					<p class="font-noto-sans popular-text" style="margin-bottom:33%;">오늘의 레시피를 통해서 함께 행복을 나눠봐요</p>
					<br>
					<span onclick="location.href='recipeList.do'" class="font-noto-sans sub-title" style="margin-right: 10%;">Recipe></span>
				</div>
				<div class="col-md-6">
					<ul class="list-base">
						<!-- 조회수 기반 -->
					</ul>
				</div>
			</div>
		</div>

		<!-- 마켓 -->
		<!-- 버튼 클릭하면 하나 삭제하고 하나 나오고 그런식으로 구현 (10개 가져와서 반복문으로 돌리자 -->
		<div class="market block">
			<div class="row">
				<div class="col-md-12 new-title">
					<p class="title-font">New Product</p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="product-input" style="width: 100%; margin: 0 3%;">
						<div class="left-btn" style="float: left">
							<img class="product-btn" src="resources/images/leftbtn.png">
						</div>

						<!-- 상품 append -->
						<div class="product-section"></div>

						<div class="rigt-btn" style="float: left">
							<img class="product-btn" src="resources/images/rightbtn.png"
								style="height: 47px; width: 45px;">
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 구독 섹션 -->
		<div>
			<div class="row block">
				<div class="col-md-1"></div>
				<div class="col-md-3">
					<div class="card"
						style="height: 380px; border: 0; border-bottom: gray 1px dotted;">
						<div class="card-body" align="right">
							<h5 class="title-font" style="margin: 1% 0 10px 0; font-size: 17px;">주기적으로 행복을 드립니다</h5>
							<p class="card-text" style="letter-spacing: 0.5px; font-size: 15px; margin-bottom: 95%;">
								바쁜 일상에 치여 집에서 식탁의 행복을 누리지 못하는 여러분들을 위한 선물
							</p>
							<span class="font-noto-sans sub-title" onclick="location.href='subMain.do'">구독 서비스 보러가기></span>
						</div>
					</div>
				</div>
				<div class="col-md-7 subSection-img" onclick="location.href='subMain.do'"></div>
			</div>
		</div>


		<!-- 회원 블로그 찜 위주 -->
		<div class="recommend-menu block" style="">
			<div class="row">
				<div class="col-md-6">
					<ul class="list-base"></ul>
				</div>
				<div class="col-md-6" style="text-align: left">
					<p class="title-font" style="margin-left: 10%; margin-bottom: 10px;">가장 사랑받는 EatDagram</p>
					<p style="margin:0 0 0 10%" class="popular-text">여러분만의 경험을 공유해보세요</p>
					<p style="margin:0 0 30% 10%" class="popular-text">세상에서 단 하나뿐인 레시피를 공유하면서 이벤트까지 응모해봐요.</p>
					<br>
					<span class="font-noto-sans sub-title" style="margin-left: 10%;" onclick="location.href='blog.do'">EatDagram></span>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<%@ include file="WEB-INF/views/common/footer.jsp"%>
	</div>

</body>
</html>