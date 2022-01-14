<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/market/marketPg.js" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/market/marketPage.css">
<style type="text/css">
#wrap {
	margin-top: 25px;
	margin-bottom: 100px;
	width: 100%;
	min-height:1600px;
}
</style>
</head>

<body style="margin: 0; min-width: 1400px; margin-top:180px;">
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">구매하시는 상품의 수량을 선택해주세요.</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="product-body">
						<div class="modal-img-section">
							<img class="product-img" src="${product.img_path}" alt="상품">
						</div>
						<div class="modal-info-section">
							<div class="modal-info-title">
								<span>${product.p_name}</span>
							</div>
							<div class="modal-info-quantity" align="center">
								<div>
									<span id="left-Button" onclick="leftButton(this)">&laquo;</span>&nbsp;
									<span id="quantity" style="font-weight: lighter;">1</span>&nbsp;
									<span id="right-Button" onclick="rightButton(this)">&raquo;</span>
								</div>
							</div>
							<div class="modal-info-price" align="center">
								<span id="price">${product.p_price}</span>
								<span>원</span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer" align="center">
					<button type="button" class="btn btn-primary" onclick="putShoppingBag()">장바구니에 담기</button>
					<button type="button" class="btn btn-primary" onclick="directPurchase()">바로 구매하기</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">쇼핑 계속하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="fixed-Banner">
		<div class="like-title">내가 찜한 상품</div>
	</div>
	<div id="wrap">
		<div class="top-section">
			<div class="top-left-section">
				<div class="img-wrap" style="height: 100%;">
					<img id="img" src="${product.img_path}">
				</div>
			</div>
			<div class="top-right-section">
				<div class="div-top-section" style="margin-bottom: 0;">
					<span class="short-desc">${product.p_short_desc}</span><br>
					<span class="title">${product.p_name}</span>
				</div>

				<div class="div-top-section" style="margin-top: 10px;">
					<div class="right-info-title">가격</div>
					<div class="right-info-desc">
						<span>${product.p_price}</span>
						<span>원</span>
					</div>
				</div>
				<div class="div-top-section">
					<div class="right-info-title">배송 정보</div>
					<div class="right-info-desc" style="margin-bottom: 20px;">
						<span>일반배송 : 3000원</span><br> <span>새벽배송 : 준비중입니다.</span>
					</div>
				</div>
				<div class="div-top-section seller-div">
					<div class="right-info-title">판매자 정보</div>
					<div class="right-info-desc">
						<span id="seller-desc">${product.seller_desc}</span>
						<span id="p-description" style="display:none;">${product.p_description}</span>
						<span id="p-amount" style="display:none;">${product.p_amount}</span>
						<span id="p-cal" style="display:none;">${product.p_cal}</span>
						<span id="p-id" style="display:none;">${product.p_id}</span>
					</div>
				</div>
				<div class="div-top-section button-wrap">
					<button class="btn btn btn-outline-danger top-button" onclick="likeThis()">찜하기</button>
					<button type="button" class="btn btn-outline-primary top-button" data-bs-toggle="modal" data-bs-target="#exampleModal">장바구니</button>
					<button type="button" class="btn btn-outline-success top-button" data-bs-toggle="modal" data-bs-target="#exampleModal">구매하기</button>
				</div>
			</div>
		</div>
		<hr style="box-shadow: 0px 0px 3px 0px gray; margin:3% 17%">
		<div class="tap-section">
			<button id="detailButton" class="btn btn-lg btn-primary tap-button" onclick="detailTap()">상품 상세정보</button>
			<button class="btn btn-lg btn-secondary tap-button" onclick="ready()">상품 문의하기</button>
			<button class="btn btn-lg btn-secondary tap-button" onclick="ready()">상품 관리하기</button>
			<button id="reviewButton" class="btn btn-lg btn-secondary tap-button" onclick="reviewTap()">리뷰</button>
		</div>

		<div class="bottom-section">
			<div class='review-wrap' style="display:none;">
				<ul class='review-ul'>
					<li class='li-tag'>
						<div class='review-top'>
							<span>전체&nbsp;(</span><span id='reviewQuantity'></span>${list.size()}<span>)</span>
							<em>※ 일부 후기는 구매자의 주관적인 소견이며 개인별로 상이할 수 있습니다.</em>
						</div>
					</li>
				</ul>
				<ul class='review-ul-body'>
					<c:forEach var="dto" items="${list}">
						<li class='li-tag'>
							<div class='review-box'>
								<div class='profile-img'>
									<img src='resources/images/userProfile/${dto.user_img}.png' alt='프로필' class='profile'>
								</div>
								<div class='review-text-div'>
									<span>${dto.review_content}</span><br>
									<span>${dto.user_id} (${dto.user_name})</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<span>작성일 : </span><span>${dto.review_regdate}</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="changeTap">
				<div class="detail-wrap" id="img-path" style="background-image:url(${product.img_path})"></div>
				
				<div class="desc-wrap bottom-gray" align="center">
					<h6 class="product-desc-letter" id="p-short-desc">${product.p_short_desc}</h6>
					<h2 class="product-desc-letter display-6" id="p-name"><b>${product.p_name}</b></h2>
				</div>
				<div class="desc-wrap" align="center">
					<span>"</span>
					<span class="product-desc-letter">${product.p_description}</span><span>"</span><br><br>
					<span class="product-desc-letter"><i style="font-size:larger">"또한,"</i></span><br><br>
					<span class="product-desc-letter">"${product.seller_desc}"</span>
				</div>
				<div class="desc-wrap">
					<div class="product-desc">
						<span class="desc-title">용&nbsp;&nbsp;&nbsp;량</span> 
						<span class="desc-info">${product.p_amount}</span><span>G</span>
					</div>
					<div class="product-desc">
						<span class="desc-title">칼로리</span> 
						<span class="desc-info">맛있게 먹으면 ${product.p_cal} 칼로리!</span>
					</div>
					<div class="product-desc">
						<span class="desc-title">원산지</span> 
						<span class="desc-info">국내산</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>