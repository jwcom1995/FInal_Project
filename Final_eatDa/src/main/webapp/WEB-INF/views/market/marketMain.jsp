<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/market/marketMainnew.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=IBM+Plex+Sans+KR:wght@200&display=swap" rel="stylesheet">
<title>Insert title here</title>

<style type="text/css">
.banner {
	background-image: url(resources/images/market/market-banner3.png);
	background-size: cover;
	width: 100%;
	margin: 0 auto;
	height: 300px;
	margin-bottom: 30px;
	padding-top: 140px;
	border-radius: 4px;
}
.product-img {
	width:100%;
	height:60%;
	overflow: hidden;
}

.p-img {
	width: 95%;
	height: 95%;
	border-radius:4px;
	transition: all 0.2s linear;
}
.product-card {
	box-shadow: 0px 4px 4px -4px gray;
	width: 26%;
	height:100%;
	float: left;
	margin: 0 auto;
}
</style>
<script src="resources/js/market/marketMain.js" type="text/javascript"></script>

</head>
<body style="margin-top:150px;">
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<!-- 본문 작성 -->
	<div class="fixed-Banner">
		<div class="like-title">내가 찜한 상품</div>
	</div>
	<div class="container" style="height: fit-content;">
		<!-- 베너 -->
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-12 banner">
				<div class="banner-content">
					<div class="banner-text" style="font-size:larger;">우리의 밥상에 건강과 행복을 차려볼까요?</div>
				</div>
				<div class="search-box-narrow">
					<input type="text" class="search-narrow" id="search-bar" placeholder="키워드를 입력해주세요.">
				</div>
			</div>
		</div>
		<!-- 태그 -->
		<div class="row">
			<ul class="keyword-tag" style="margin: 0 auto; width: auto;">
				<li>
                    <span class="total-keyword" onclick="totalProduct()" style="color: red;">#키워드검색</span>
                </li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#양식</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#중식</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#일식</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#한식</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#비건</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#고기만</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#해산물</span></li>
				<li><span class="keyword" onclick="hashTagSearch(this)">#스페인</span></li>
			</ul>
		</div>
		<hr id="horizontal">
		<div class="product-container">
		<!-- 상품 리스트 -->
		</div>
		<div class="row" style="margin: 0 auto;">
			<!--페이징 구현-->
			<!-- 현재 페이지는 class='active' -->
			<div class="col-md-12" align="center">
				<div class="paging-section">
					<div class="pagination" style="justify-content:center; align-items:center; margin-top:100px;"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>