<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/market/orderSuccess.css">
<title>Insert title here</title>
<script src="resources/js/market/orderSuccess.js" type="text/javascript"></script>
</head>
<body style="margin-top:200px;">
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
    <div class="container-fluid">
        <div class="row rows-width first-section" style="margin:0px auto; margin-top: 5%;">
            <div class="col-md-12" align="center">
                <h1 class="display-5" style="font-weight: bold; letter-spacing:3px;">주문 완료</h1><br>
                <div class="desc">주문이 정상적으로 완료되었습니다.</div>
                <div class="desc">주문하신 내역은 마이페이지 > 내 주문목록 에서 확인하실 수 있습니다.</div>
                <br>
                <div class="desc">* 카드 결제 시 바로 상품 준비가 시작됩니다.</div>
                <div class="desc">* 무통장 입금으로 결제 진행 시 입금 확인 후 상품 준비가 시작됩니다.</div>
                <div style="display:none;" id="coupon-id">${order.coupon_id}</div>
                <div style="display:none;" id="coupon-rate">${order.coupon_rate}</div>
                <div style="display:none;" id="user-id">${order.user_id}</div>
                <div style="display:none;" id="order-id">${order.order_id}</div>
            </div>
        </div>

        <div class="row rows-width second-section" style="margin:0px auto;">
            <div class="col-md-12" align="center" style="height: 120px; padding-top:30px;">
                <div class="desc">무통장 입금 시 주문 날짜 3일 이내에 입금 완료를 해주셔야 주문이 진행됩니다.</div>
                <div class="desc" style="margin-top:30px;">계좌번호 : (주)EatDa : (기업은행)123-456-7891011</div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row rows-width title-section" style="margin:0px auto; margin-top: 5%;">
            <h4>주문 상품 정보</h4>
        </div>
    </div>
    
    <div class="container-fluid">
        <div class="row rows-width payment-section" style="margin:0px auto;">
            <h4>결제 정보</h4>
        </div>
        <div class="row rows-width bottom-box-shadow" style="margin:0px auto; padding-bottom:2%;">
            <div class="col-md-12 li-div">
            	<div>
            		<span class="title">총 상품 금액 : </span>
					<span>${order.original_price}</span>
            		<span>&#8361;</span>
          		</div>
          		<div>
            		<span class="title">총 할인 금액 : </span>
            		<span>${order.discount_price}</span>
            		<span>&#8361;</span>
          		</div>
          		<div>
            		<span class="title">총 결제 금액 : </span>
            		<span>${order.order_price}</span>
            		<span>&#8361;</span>
          		</div>
          		<div>
            		<span class="title">주문번호 : </span>
            		<span>${order.order_id}</span>
          		</div>
          		<div>
            		<span class="title">결제방식 : </span>
            		<span>${order.pay_option}</span>
          		</div>
          		<div>
            		<span class="title">주문일시 : </span>
            		<span>${order.order_date}</span>
          		</div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row rows-width payment-section" style="margin:0px auto;">
            <h4>배송지 정보</h4>
        </div>
        <div class="row rows-width bottom-box-shadow" style="margin:0px auto; padding-bottom:2%;">
            <div class="col-md-12 li-div" style="margin-bottom:10px;">
            	<div>
            		<span class="title">받는 분 : </span>
            		<span>${order.order_name }</span>
          		</div>
          		<div>
            		<span class="title">연락처 : </span>
            		<span>${order.order_phone }</span>
          		</div>
          		<div>
            		<span class="title">주소 : </span>
            		<span>${order.order_addr }</span>
          		</div>
          		<div>
            		<span class="title">배송 메시지 : </span>
            		<span>${order.order_message }</span>
          		</div>
            </div>
        </div>

        <div class="row rows-width btn-part" style="margin:30px auto 100px;">
            <div class="col-md-2"></div>
            <div class="col-md-8" align="center">
                <button class="btn btn-primary btn-lg bottm-btn" onclick="goMain('index')">홈으로</button>
                <button class="btn btn-primary btn-lg bottm-btn" onclick="goMain('marketMain')">쇼핑 계속하기</button>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>