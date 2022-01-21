<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/index.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=IBM+Plex+Sans+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common/index.css">
<title>행복을 함께 나누다 EatDa</title>
<style type="text/css">
.banner {
	background-image: url(resources/images/recipe/main-banner2.png);
	background-size: cover;
	width: 100%;
	margin: 0 auto;
	height: 280px;
	margin-bottom: 30px;
	padding-top: 180px;
	border-radius: 4px;
}
.subSection-img {
	background-image: url(resources/images/sub-envelope.jpeg);
	background-size: cover;
	background-repeat: none;
}
</style>
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
