<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/market/shoppingBag.css">
<script type="text/javascript" src="resources/js/market/shoppingBag.js"></script>
</head>

<body style="margin:0; min-width:1400px; margin-top:150px; margin-top:200px;">
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="container wrap">

        <div class="row rows-width order-title" style="margin: 0 auto; margin-bottom:60px;">
            <div class="col-lg-6 title">
                <div class="display-6">
                    <b>장바구니</b>
                </div>
            </div>
            <div class="col-lg-6 title-process">
                <span class="title-process-span">
                    <span class="title-process-span-bold">01 장바구니</span> > 02 주문 및 결제 > 03 주문완료
                </span>
            </div>
        </div>

        <div class="row rows-width order-middle" style="margin: 0 auto; padding-bottom:10px;">
            <div class="col-lg-6 order-table">
                <div class="order-table-column now-tab division-col" id="norDev" onclick="normalDelivery()">일반배송</div>
                <div class="order-table-column" id="subDev" onclick="subDelivery()">구독배송</div>
            </div>
            <div class="col-lg-6 order-table desc-order">
                장바구니에 담긴 상품은 14일간 보관되며, 이후 좋아요 목록으로 이동됩니다.
            </div>
        </div>

        <div class="row rows-width order-middle-second" style="margin: 0 auto;">
            <div class="col-lg-6 order-middle-second-col">
                <img src="resources/images/market/check.png" id="m-check" onclick="pushMulti()">
                <label style="margin-left:10px; margin-bottom:5px;">전체선택</label>
            </div>
            <div class="col-lg-6 order-middle-second-col" align="right">
                <span id="choice-delete" onclick="choiceDelete()">선택삭제</span>
            </div>
        </div>

        <div class="row rows-width order-product" style="margin: 0 auto;">
        	<!-- 줄 시작 -->
			<c:forEach var="dto" items="${list}">
				<div class="start-row">
					<div class="category" style="display:none;">${dto.category}</div>
	                <div class="col-lg-8 left-col">
	                    <div class="left-col-check">
							<input type="checkbox" class="check-img" name="checkbox">
							<span class="p-id" style="display:none;">${dto.p_id}</span>
	                    </div>
	                    <div class="left-col-img">
	                        <img src="${dto.img_path}" alt="상품 이미지" class="product-img">
	                    </div>
	                    <div class="left-col-title">
	                        ${dto.p_name}
	                    </div>
	                </div>
	                <div class="col-lg-4 right-col">
	                    <!-- 수량선택 -->
	                    <div class="right-col-quantity">
	                        <span id="left-Button" onclick="leftButton(this)">&laquo;</span>&nbsp;
	                        <span class="quantity" style="font-weight:bold;">${dto.cart_count}</span>&nbsp;
	                        <span id="right-Button" onclick="rightButton(this)">&raquo;</span>
	                    </div>
	
	                    <!-- 가격 -->
	                    <div class="right-col-price">
	                        <span class="each-price">${dto.cart_price}</span>
	                        <span>원</span>
	                    </div>
	                </div>
	            </div>
			</c:forEach>
        </div>

        <!-- 총 가격 -->
        <div class="row rows-width order-total" style="margin: 0 auto; margin-top:30px;">
            <div class="order-total-desc">
                총 결제 금액
            </div>
            <div class="order-total-price">
                <span id="totalPrice"></span>
                <span class="sub-price" style="display:none;">0</span>
                <span>원</span>
            </div>
        </div>

        <!-- 하단 버튼 2개 -->
        <div class="row rows-width order-button" style="margin: 0 auto; margin-top:5%;">
            <div class="col-lg-12">
                <button class="btn btn-primary bottom-btn" onclick="makeOrder()">주문하기</button>
                <button class="btn btn-primary bottom-btn" onclick="goMarketMain()">쇼핑 계속하기</button>
            </div>
        </div>

    </div>
    
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>

</body>
</html>